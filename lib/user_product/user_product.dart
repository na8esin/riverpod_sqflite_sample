import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database.dart';

part 'user_product.freezed.dart';
part 'user_product.g.dart';

const String _tableName = 'user_products';
const String columnId = 'id';
const String columnInUse = 'inUse';
const List<String> columns = [columnId, columnInUse];

// ROWIDをそのまま使うか迷う。
// integer primary keyは結局ROWIDのエイリアスなので、
// autoincrementは必要ないはず
// see: https://www.sqlite.org/rowidtable.html
//
// boolを使うと下記のエラーが出るので、integerで代用
// Invalid argument false with type bool.
// Only num, String and Uint8List are supported. See https://github.com/tekartik/sqflite/blob/master/sqflite/doc/supported_types.md for details
const createUserProducts = '''
create table $_tableName (
  $columnId integer primary key,
  $columnInUse integer
  )
''';

@riverpod
Future<List<UserProduct>?> allUserProducts(AllUserProductsRef ref) async {
  final repository = await ref.watch(userProductRepositoryProvider.future);
  return repository.findAll();
}

@riverpod
Future<UserProductRepository> userProductRepository(
    UserProductRepositoryRef ref) async {
  final db = await ref.read(databaseProvider.future);
  return UserProductRepository(db);
}

// userの持ってるproduct
// とりあえず、idと利用状況。titleなどはapiから取得
@freezed
class UserProduct with _$UserProduct {
  const factory UserProduct({int? id, required int inUse}) = _UserProduct;

  factory UserProduct.fromJson(Map<String, Object?> json) =>
      _$UserProductFromJson(json);
}

// サンプルコードはProviderだけど、Repositoryの方がいいかなと思う
class UserProductRepository {
  UserProductRepository(this.db);

  final Database db;

  Future<UserProduct> insert(UserProduct userProduct) async {
    final id = await db.insert(_tableName, userProduct.toJson());
    return userProduct.copyWith(id: id);
  }

  Future<UserProduct?> find(int id) async {
    List<Map<String, Object?>> maps = await db.query(_tableName,
        columns: columns, where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserProduct.fromJson(maps.first);
    }
    return null;
  }

  Future<List<UserProduct>> findAll() async {
    List<Map<String, Object?>> maps = await db.query(
      _tableName,
      columns: columns,
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => UserProduct.fromJson(e)).toList();
    }
    return [];
  }

  Future<int> delete(int id) async {
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(UserProduct userProduct) async {
    return await db.update(_tableName, userProduct.toJson(),
        where: '$columnId = ?', whereArgs: [userProduct.id]);
  }

  Future<void> syncData(List<UserProduct> userProducts) async {
    print("sync complete befor");

    print("db.isOpen = ${db.isOpen}");

    try {
      // 全削除
      final deleteCount = await db.delete(_tableName);
      print(deleteCount);
    } catch (e) {
      print(e);
    }

    print("sync complete after delete.");

    // 全挿入
    final futures = [for (var e in userProducts) insert(e)];
    await Future.wait(futures);
    print("sync complete ");
  }

  Future close() async => db.close();
}

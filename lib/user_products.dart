import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'database.dart';

part 'user_products.freezed.dart';
part 'user_products.g.dart';

const String _tableName = 'user_products';
const String columnId = 'id';

@riverpod
Future<List<UserProduct>?> allUserProducts(AllUserProductsRef ref) async {
  final repository = await ref.watch(userProductRepositoryProvider.future);
  return repository.findAll();
}

@riverpod
Future<UserProductRepository> userProductRepository(
    UserProductRepositoryRef ref) async {
  final path = await ref.watch(databasesPathProvider.future);
  final repository = UserProductRepository();
  await repository.open(path);
  // データをあらかじめ２つくらい入れておく
  repository.insert(const UserProduct());
  repository.insert(const UserProduct());
  return repository;
}

// userの持ってるproduct
// とりあえず、idだけを持ってる。titleなどはapiから取得
@freezed
class UserProduct with _$UserProduct {
  const factory UserProduct({
    int? id,
  }) = _UserProduct;

  factory UserProduct.fromJson(Map<String, Object?> json) =>
      _$UserProductFromJson(json);
}

// サンプルコードはProviderだけど、Repositoryが相当かなと思う
class UserProductRepository {
  // dbは引数などで入れたほうがいいと思うけど、簡単のため
  late Database db;

  // open関数も本来は別のところが良さそう。
  // 実際はテーブルが一つだけじゃないだろうし、migrationも意識してonUpgradeと
  // 同じ場所に実装したいはず。
  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // ROWIDをそのまま使うか迷うところ。
      // integer primary keyは結局ROWIDのエイリアスなので、
      // autoincrementは必要ないはず
      // see: https://www.sqlite.org/rowidtable.html
      await db.execute('''
create table $_tableName (
  $columnId integer primary key)
''');
    });
  }

  Future<UserProduct> insert(UserProduct userProduct) async {
    final id = await db.insert(_tableName, userProduct.toJson());
    return userProduct.copyWith(id: id);
  }

  Future<UserProduct?> find(int id) async {
    List<Map<String, Object?>> maps = await db.query(_tableName,
        columns: [columnId], where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserProduct.fromJson(maps.first);
    }
    return null;
  }

  Future<List<UserProduct>?> findAll() async {
    List<Map<String, Object?>> maps = await db.query(
      _tableName,
      columns: [columnId],
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => UserProduct.fromJson(e)).toList();
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(UserProduct userProduct) async {
    return await db.update(_tableName, userProduct.toJson(),
        where: '$columnId = ?', whereArgs: [userProduct.id]);
  }

  Future close() async => db.close();
}

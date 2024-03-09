import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database.dart';

part 'user_device.freezed.dart';
part 'user_device.g.dart';

const String _tableName = 'user_devices';
const String columnId = 'id';
const String columnInUse = 'inUse';
const List<String> columns = [columnId, columnInUse];

@riverpod
Future<List<UserDevice>?> allUserDevices(AllUserDevicesRef ref) async {
  final repository = await ref.watch(userDeviceRepositoryProvider.future);
  return repository.findAll();
}

@riverpod
Future<UserDeviceRepository> userDeviceRepository(
    UserDeviceRepositoryRef ref) async {
  final path = await ref.watch(databasesPathProvider.future);
  final repository = UserDeviceRepository();
  await repository.open(path);

  // データをあらかじめ２つくらい入れておく
  repository.insert(const UserDevice(inUse: 0));
  repository.insert(const UserDevice(inUse: 1));
  return repository;
}

// userの持ってるdevice
// とりあえず、idと利用状況。titleなどはapiから取得
@freezed
class UserDevice with _$UserDevice {
  const factory UserDevice({int? id, required int inUse}) = _UserDevice;

  factory UserDevice.fromJson(Map<String, Object?> json) =>
      _$UserDeviceFromJson(json);
}

// サンプルコードはProviderだけど、Repositoryの方がいいかなと思う
class UserDeviceRepository {
  // dbは引数などで入れたほうがいいと思うけど、簡単のためそのまま
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

      // boolを使うと下記のエラーが出るので、integerで代用
      // Invalid argument false with type bool.
      // Only num, String and Uint8List are supported. See https://github.com/tekartik/sqflite/blob/master/sqflite/doc/supported_types.md for details
      await db.execute('''
create table $_tableName (
  $columnId integer primary key,
  $columnInUse integer
  )
''');
    });
  }

  Future<UserDevice> insert(UserDevice userDevice) async {
    final id = await db.insert(_tableName, userDevice.toJson());
    return userDevice.copyWith(id: id);
  }

  Future<UserDevice?> find(int id) async {
    List<Map<String, Object?>> maps = await db.query(_tableName,
        columns: columns, where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserDevice.fromJson(maps.first);
    }
    return null;
  }

  Future<List<UserDevice>?> findAll() async {
    List<Map<String, Object?>> maps = await db.query(
      _tableName,
      columns: columns,
    );
    if (maps.isNotEmpty) {
      return maps.map((e) => UserDevice.fromJson(e)).toList();
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(UserDevice userDevice) async {
    return await db.update(_tableName, userDevice.toJson(),
        where: '$columnId = ?', whereArgs: [userDevice.id]);
  }

  Future close() async => db.close();
}

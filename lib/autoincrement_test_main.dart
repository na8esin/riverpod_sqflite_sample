import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'user_device/user_device.dart';

// integer primary keyはautoincrementを指定しなくても
// autoincrementされることの検証
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

  // 簡単のため、一回一回DBを削除してます。
  // 商用のコードではあまりやることはないはず。
  await deleteDatabase(path);

  final repository = UserDeviceRepository();
  await repository.open(path);
  await repository.insert(const UserDevice(inUse: true));
  await repository.insert(const UserDevice(inUse: false));
  final entities = await repository.findAll();
  print(entities);
}
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_product/user_product.dart';

part 'database.g.dart';

@riverpod
Future<Database> database (DatabaseRef ref) async {
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'demo.db');
  // 簡単のため、一回一回DBを削除してます。
  // 商用のコードではあまりやることはないはず。
  // await deleteDatabase(path);

  return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(createUserProducts);
    });
}
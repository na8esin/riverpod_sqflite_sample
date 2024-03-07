import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@riverpod
Future<String> databasesPath(DatabasesPathRef ref) async {
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'demo.db');
  // 簡単のため、一回一回DBを削除してます。
  // 商用のコードではあまりやることはないはず。
  await deleteDatabase(path);
  return path;
}

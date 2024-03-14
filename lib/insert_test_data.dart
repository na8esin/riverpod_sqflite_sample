import 'package:riverpod/riverpod.dart';

import 'database.dart';
import 'user_product/user_product.dart';

Future<UserProductRepository> insertTestData() async {
  // データをあらかじめ２つくらい入れておく
  final container = ProviderContainer();
  final db = await container.read(databaseProvider.future);

  final repository = UserProductRepository(db);

  final data = await repository.findAll();

  // データがない場合だけ入れる
  if (data.isEmpty) {
    await repository.insert(const UserProduct(inUse: 1));
    await repository.insert(const UserProduct(inUse: 0));
  }

  return repository;
}

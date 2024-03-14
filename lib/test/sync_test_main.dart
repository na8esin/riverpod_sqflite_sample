import 'package:flutter/material.dart';

import '../insert_test_data.dart';
import '../user_product/user_product.dart';

// syncDataのテスト
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // データを入れておく
  final repository = await insertTestData();

  await repository.syncData([
    const UserProduct(id: 1, inUse: 0),
    const UserProduct(id: 2, inUse: 1),
  ]);
}

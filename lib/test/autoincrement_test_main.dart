import 'package:flutter/material.dart';

import '../insert_test_data.dart';

// integer primary keyはautoincrementを指定しなくても
// autoincrementされることの検証
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = await insertTestData();
  final entities = await repository.findAll();
  print(entities);
}

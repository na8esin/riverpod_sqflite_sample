
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../products/products.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final response = await dio.get('https://dummyjson.com/products?limit=10');
  // 簡単のため、地道にキャストしてく
  final data = response.data as Map<String, dynamic>;
  final products = data['products'] as List<dynamic>;
  for (var e in products) {
    print(Product.fromJson(e));
  }
}

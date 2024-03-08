import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products.freezed.dart';
part 'products.g.dart';

// 名前に反して、10件で制限してます
@riverpod
Future<List<Product>?> allProducts(AllProductsRef ref) async {
  final dio = Dio();
  final response = await dio.get('https://dummyjson.com/products?limit=10');
  // 簡単のため、地道にキャストしてく
  final data = response.data as Map<String, dynamic>;
  final products = data['products'] as List<dynamic>;
  return products.map((e) => Product.fromJson(e)).toList();
}

// apiの方のモデル
@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    required String title,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}

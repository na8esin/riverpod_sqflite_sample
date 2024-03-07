// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allProductsHash() => r'bf70f44db310c52a22658b1c186ff9c65d5bfe15';

/// See also [allProducts].
@ProviderFor(allProducts)
final allProductsProvider = AutoDisposeFutureProvider<List<Product>?>.internal(
  allProducts,
  name: r'allProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllProductsRef = AutoDisposeFutureProviderRef<List<Product>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

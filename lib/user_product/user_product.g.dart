// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProductImpl _$$UserProductImplFromJson(Map<String, dynamic> json) =>
    _$UserProductImpl(
      id: json['id'] as int?,
      inUse: json['inUse'] as int,
    );

Map<String, dynamic> _$$UserProductImplToJson(_$UserProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inUse': instance.inUse,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allUserProductsHash() => r'b903be18534f6eb91f5b1c2e3b0eeb53d4689b96';

/// See also [allUserProducts].
@ProviderFor(allUserProducts)
final allUserProductsProvider =
    AutoDisposeFutureProvider<List<UserProduct>?>.internal(
  allUserProducts,
  name: r'allUserProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allUserProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllUserProductsRef = AutoDisposeFutureProviderRef<List<UserProduct>?>;
String _$userProductRepositoryHash() =>
    r'56721143d30a97d6329fcfc4e2cbaef2dc93d99e';

/// See also [userProductRepository].
@ProviderFor(userProductRepository)
final userProductRepositoryProvider =
    AutoDisposeFutureProvider<UserProductRepository>.internal(
  userProductRepository,
  name: r'userProductRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProductRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserProductRepositoryRef
    = AutoDisposeFutureProviderRef<UserProductRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

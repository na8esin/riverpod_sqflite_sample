// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDeviceImpl _$$UserDeviceImplFromJson(Map<String, dynamic> json) =>
    _$UserDeviceImpl(
      id: json['id'] as int?,
      inUse: json['inUse'] as int,
    );

Map<String, dynamic> _$$UserDeviceImplToJson(_$UserDeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inUse': instance.inUse,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allUserDevicesHash() => r'648fd22964aef012a9cba5465e7f11ca673c2fa0';

/// See also [allUserDevices].
@ProviderFor(allUserDevices)
final allUserDevicesProvider =
    AutoDisposeFutureProvider<List<UserDevice>?>.internal(
  allUserDevices,
  name: r'allUserDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allUserDevicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllUserDevicesRef = AutoDisposeFutureProviderRef<List<UserDevice>?>;
String _$userDeviceRepositoryHash() =>
    r'677eeead4803ec5d392c664d16fa189b49d21da9';

/// See also [userDeviceRepository].
@ProviderFor(userDeviceRepository)
final userDeviceRepositoryProvider =
    AutoDisposeFutureProvider<UserDeviceRepository>.internal(
  userDeviceRepository,
  name: r'userDeviceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDeviceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDeviceRepositoryRef
    = AutoDisposeFutureProviderRef<UserDeviceRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

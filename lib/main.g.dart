// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredDevicesHash() => r'7e3f11afe32d3ce9c4eb29cd888fd1064935e804';

/// See also [filteredDevices].
@ProviderFor(filteredDevices)
final filteredDevicesProvider =
    AutoDisposeFutureProvider<List<UserDevice>?>.internal(
  filteredDevices,
  name: r'filteredDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredDevicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredDevicesRef = AutoDisposeFutureProviderRef<List<UserDevice>?>;
String _$currentItemHash() => r'd3fe73d686047b1ec13a0e8599cd3870f7538486';

/// See also [currentItem].
@ProviderFor(currentItem)
final currentItemProvider = AutoDisposeProvider<UserDevice>.internal(
  currentItem,
  name: r'currentItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentItemHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef CurrentItemRef = AutoDisposeProviderRef<UserDevice>;
String _$listFilterNotifierHash() =>
    r'95c031f8a9da2dfcb2ac7794559951d8f464465c';

/// See also [ListFilterNotifier].
@ProviderFor(ListFilterNotifier)
final listFilterNotifierProvider =
    AutoDisposeNotifierProvider<ListFilterNotifier, DeviceState>.internal(
  ListFilterNotifier.new,
  name: r'listFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListFilterNotifier = AutoDisposeNotifier<DeviceState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

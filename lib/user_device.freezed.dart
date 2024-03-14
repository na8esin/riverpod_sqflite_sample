// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDevice {
  int? get id => throw _privateConstructorUsedError;
  int get inUse => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDeviceCopyWith<UserDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceCopyWith<$Res> {
  factory $UserDeviceCopyWith(
          UserDevice value, $Res Function(UserDevice) then) =
      _$UserDeviceCopyWithImpl<$Res, UserDevice>;
  @useResult
  $Res call({int? id, int inUse, String name});
}

/// @nodoc
class _$UserDeviceCopyWithImpl<$Res, $Val extends UserDevice>
    implements $UserDeviceCopyWith<$Res> {
  _$UserDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? inUse = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inUse: null == inUse
          ? _value.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDeviceImplCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$UserDeviceImplCopyWith(
          _$UserDeviceImpl value, $Res Function(_$UserDeviceImpl) then) =
      __$$UserDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int inUse, String name});
}

/// @nodoc
class __$$UserDeviceImplCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$UserDeviceImpl>
    implements _$$UserDeviceImplCopyWith<$Res> {
  __$$UserDeviceImplCopyWithImpl(
      _$UserDeviceImpl _value, $Res Function(_$UserDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? inUse = null,
    Object? name = null,
  }) {
    return _then(_$UserDeviceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inUse: null == inUse
          ? _value.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserDeviceImpl extends _UserDevice {
  const _$UserDeviceImpl({this.id, required this.inUse, required this.name})
      : super._();

  @override
  final int? id;
  @override
  final int inUse;
  @override
  final String name;

  @override
  String toString() {
    return 'UserDevice(id: $id, inUse: $inUse, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inUse, inUse) || other.inUse == inUse) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, inUse, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceImplCopyWith<_$UserDeviceImpl> get copyWith =>
      __$$UserDeviceImplCopyWithImpl<_$UserDeviceImpl>(this, _$identity);
}

abstract class _UserDevice extends UserDevice {
  const factory _UserDevice(
      {final int? id,
      required final int inUse,
      required final String name}) = _$UserDeviceImpl;
  const _UserDevice._() : super._();

  @override
  int? get id;
  @override
  int get inUse;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserDeviceImplCopyWith<_$UserDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Devices {
  List<UserDevice> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DevicesCopyWith<Devices> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicesCopyWith<$Res> {
  factory $DevicesCopyWith(Devices value, $Res Function(Devices) then) =
      _$DevicesCopyWithImpl<$Res, Devices>;
  @useResult
  $Res call({List<UserDevice> devices});
}

/// @nodoc
class _$DevicesCopyWithImpl<$Res, $Val extends Devices>
    implements $DevicesCopyWith<$Res> {
  _$DevicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<UserDevice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevicesImplCopyWith<$Res> implements $DevicesCopyWith<$Res> {
  factory _$$DevicesImplCopyWith(
          _$DevicesImpl value, $Res Function(_$DevicesImpl) then) =
      __$$DevicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserDevice> devices});
}

/// @nodoc
class __$$DevicesImplCopyWithImpl<$Res>
    extends _$DevicesCopyWithImpl<$Res, _$DevicesImpl>
    implements _$$DevicesImplCopyWith<$Res> {
  __$$DevicesImplCopyWithImpl(
      _$DevicesImpl _value, $Res Function(_$DevicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$DevicesImpl(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<UserDevice>,
    ));
  }
}

/// @nodoc

class _$DevicesImpl implements _Devices {
  const _$DevicesImpl({required final List<UserDevice> devices})
      : _devices = devices;

  final List<UserDevice> _devices;
  @override
  List<UserDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'Devices(devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicesImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicesImplCopyWith<_$DevicesImpl> get copyWith =>
      __$$DevicesImplCopyWithImpl<_$DevicesImpl>(this, _$identity);
}

abstract class _Devices implements Devices {
  const factory _Devices({required final List<UserDevice> devices}) =
      _$DevicesImpl;

  @override
  List<UserDevice> get devices;
  @override
  @JsonKey(ignore: true)
  _$$DevicesImplCopyWith<_$DevicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

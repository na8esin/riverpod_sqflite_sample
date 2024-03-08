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

UserDevice _$UserDeviceFromJson(Map<String, dynamic> json) {
  return _UserDevice.fromJson(json);
}

/// @nodoc
mixin _$UserDevice {
  int? get id => throw _privateConstructorUsedError;
  bool get inUse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
  $Res call({int? id, bool inUse});
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
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inUse: null == inUse
          ? _value.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({int? id, bool inUse});
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
  }) {
    return _then(_$UserDeviceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      inUse: null == inUse
          ? _value.inUse
          : inUse // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDeviceImpl with DiagnosticableTreeMixin implements _UserDevice {
  const _$UserDeviceImpl({this.id, required this.inUse});

  factory _$UserDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDeviceImplFromJson(json);

  @override
  final int? id;
  @override
  final bool inUse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDevice(id: $id, inUse: $inUse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDevice'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('inUse', inUse));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inUse, inUse) || other.inUse == inUse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, inUse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDeviceImplCopyWith<_$UserDeviceImpl> get copyWith =>
      __$$UserDeviceImplCopyWithImpl<_$UserDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDeviceImplToJson(
      this,
    );
  }
}

abstract class _UserDevice implements UserDevice {
  const factory _UserDevice({final int? id, required final bool inUse}) =
      _$UserDeviceImpl;

  factory _UserDevice.fromJson(Map<String, dynamic> json) =
      _$UserDeviceImpl.fromJson;

  @override
  int? get id;
  @override
  bool get inUse;
  @override
  @JsonKey(ignore: true)
  _$$UserDeviceImplCopyWith<_$UserDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

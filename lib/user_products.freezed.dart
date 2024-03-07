// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProduct _$UserProductFromJson(Map<String, dynamic> json) {
  return _UserProduct.fromJson(json);
}

/// @nodoc
mixin _$UserProduct {
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProductCopyWith<UserProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProductCopyWith<$Res> {
  factory $UserProductCopyWith(
          UserProduct value, $Res Function(UserProduct) then) =
      _$UserProductCopyWithImpl<$Res, UserProduct>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class _$UserProductCopyWithImpl<$Res, $Val extends UserProduct>
    implements $UserProductCopyWith<$Res> {
  _$UserProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProductImplCopyWith<$Res>
    implements $UserProductCopyWith<$Res> {
  factory _$$UserProductImplCopyWith(
          _$UserProductImpl value, $Res Function(_$UserProductImpl) then) =
      __$$UserProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$UserProductImplCopyWithImpl<$Res>
    extends _$UserProductCopyWithImpl<$Res, _$UserProductImpl>
    implements _$$UserProductImplCopyWith<$Res> {
  __$$UserProductImplCopyWithImpl(
      _$UserProductImpl _value, $Res Function(_$UserProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$UserProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProductImpl with DiagnosticableTreeMixin implements _UserProduct {
  const _$UserProductImpl({this.id});

  factory _$UserProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProductImplFromJson(json);

  @override
  final int? id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProduct(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProduct'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProductImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProductImplCopyWith<_$UserProductImpl> get copyWith =>
      __$$UserProductImplCopyWithImpl<_$UserProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProductImplToJson(
      this,
    );
  }
}

abstract class _UserProduct implements UserProduct {
  const factory _UserProduct({final int? id}) = _$UserProductImpl;

  factory _UserProduct.fromJson(Map<String, dynamic> json) =
      _$UserProductImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$UserProductImplCopyWith<_$UserProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

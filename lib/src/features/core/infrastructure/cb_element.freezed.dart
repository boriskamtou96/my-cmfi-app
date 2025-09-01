// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cb_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CBElement _$CBElementFromJson(Map<String, dynamic> json) {
  return _CBElement.fromJson(json);
}

/// @nodoc
mixin _$CBElement {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this CBElement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CBElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CBElementCopyWith<CBElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CBElementCopyWith<$Res> {
  factory $CBElementCopyWith(CBElement value, $Res Function(CBElement) then) =
      _$CBElementCopyWithImpl<$Res, CBElement>;
  @useResult
  $Res call(
      {int id, String code, String name, String? description, bool isSelected});
}

/// @nodoc
class _$CBElementCopyWithImpl<$Res, $Val extends CBElement>
    implements $CBElementCopyWith<$Res> {
  _$CBElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CBElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = freezed,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CBElementImplCopyWith<$Res>
    implements $CBElementCopyWith<$Res> {
  factory _$$CBElementImplCopyWith(
          _$CBElementImpl value, $Res Function(_$CBElementImpl) then) =
      __$$CBElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String code, String name, String? description, bool isSelected});
}

/// @nodoc
class __$$CBElementImplCopyWithImpl<$Res>
    extends _$CBElementCopyWithImpl<$Res, _$CBElementImpl>
    implements _$$CBElementImplCopyWith<$Res> {
  __$$CBElementImplCopyWithImpl(
      _$CBElementImpl _value, $Res Function(_$CBElementImpl) _then)
      : super(_value, _then);

  /// Create a copy of CBElement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? description = freezed,
    Object? isSelected = null,
  }) {
    return _then(_$CBElementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CBElementImpl implements _CBElement {
  const _$CBElementImpl(
      {required this.id,
      required this.code,
      required this.name,
      this.description,
      this.isSelected = false});

  factory _$CBElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$CBElementImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'CBElement(id: $id, code: $code, name: $name, description: $description, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CBElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, name, description, isSelected);

  /// Create a copy of CBElement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CBElementImplCopyWith<_$CBElementImpl> get copyWith =>
      __$$CBElementImplCopyWithImpl<_$CBElementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CBElementImplToJson(
      this,
    );
  }
}

abstract class _CBElement implements CBElement {
  const factory _CBElement(
      {required final int id,
      required final String code,
      required final String name,
      final String? description,
      final bool isSelected}) = _$CBElementImpl;

  factory _CBElement.fromJson(Map<String, dynamic> json) =
      _$CBElementImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  String? get description;
  @override
  bool get isSelected;

  /// Create a copy of CBElement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CBElementImplCopyWith<_$CBElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

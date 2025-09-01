// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_element_selections.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserElementSelections _$UserElementSelectionsFromJson(
    Map<String, dynamic> json) {
  return _UserElementSelections.fromJson(json);
}

/// @nodoc
mixin _$UserElementSelections {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cb_element_id')
  int get cbElementId => throw _privateConstructorUsedError;

  /// Serializes this UserElementSelections to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserElementSelections
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserElementSelectionsCopyWith<UserElementSelections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserElementSelectionsCopyWith<$Res> {
  factory $UserElementSelectionsCopyWith(UserElementSelections value,
          $Res Function(UserElementSelections) then) =
      _$UserElementSelectionsCopyWithImpl<$Res, UserElementSelections>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'cb_element_id') int cbElementId});
}

/// @nodoc
class _$UserElementSelectionsCopyWithImpl<$Res,
        $Val extends UserElementSelections>
    implements $UserElementSelectionsCopyWith<$Res> {
  _$UserElementSelectionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserElementSelections
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? cbElementId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      cbElementId: null == cbElementId
          ? _value.cbElementId
          : cbElementId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserElementSelectionsImplCopyWith<$Res>
    implements $UserElementSelectionsCopyWith<$Res> {
  factory _$$UserElementSelectionsImplCopyWith(
          _$UserElementSelectionsImpl value,
          $Res Function(_$UserElementSelectionsImpl) then) =
      __$$UserElementSelectionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'cb_element_id') int cbElementId});
}

/// @nodoc
class __$$UserElementSelectionsImplCopyWithImpl<$Res>
    extends _$UserElementSelectionsCopyWithImpl<$Res,
        _$UserElementSelectionsImpl>
    implements _$$UserElementSelectionsImplCopyWith<$Res> {
  __$$UserElementSelectionsImplCopyWithImpl(_$UserElementSelectionsImpl _value,
      $Res Function(_$UserElementSelectionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserElementSelections
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? cbElementId = null,
  }) {
    return _then(_$UserElementSelectionsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      cbElementId: null == cbElementId
          ? _value.cbElementId
          : cbElementId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserElementSelectionsImpl implements _UserElementSelections {
  const _$UserElementSelectionsImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'cb_element_id') required this.cbElementId});

  factory _$UserElementSelectionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserElementSelectionsImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'cb_element_id')
  final int cbElementId;

  @override
  String toString() {
    return 'UserElementSelections(userId: $userId, cbElementId: $cbElementId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserElementSelectionsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.cbElementId, cbElementId) ||
                other.cbElementId == cbElementId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, cbElementId);

  /// Create a copy of UserElementSelections
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserElementSelectionsImplCopyWith<_$UserElementSelectionsImpl>
      get copyWith => __$$UserElementSelectionsImplCopyWithImpl<
          _$UserElementSelectionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserElementSelectionsImplToJson(
      this,
    );
  }
}

abstract class _UserElementSelections implements UserElementSelections {
  const factory _UserElementSelections(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'cb_element_id') required final int cbElementId}) =
      _$UserElementSelectionsImpl;

  factory _UserElementSelections.fromJson(Map<String, dynamic> json) =
      _$UserElementSelectionsImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'cb_element_id')
  int get cbElementId;

  /// Create a copy of UserElementSelections
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserElementSelectionsImplCopyWith<_$UserElementSelectionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

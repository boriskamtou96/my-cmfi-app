// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_element_selections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserElementSelectionsImpl _$$UserElementSelectionsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserElementSelectionsImpl(
      userId: json['user_id'] as String,
      cbElementId: (json['cb_element_id'] as num).toInt(),
    );

Map<String, dynamic> _$$UserElementSelectionsImplToJson(
        _$UserElementSelectionsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'cb_element_id': instance.cbElementId,
    };

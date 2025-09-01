// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cb_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CBElementImpl _$$CBElementImplFromJson(Map<String, dynamic> json) =>
    _$CBElementImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$CBElementImplToJson(_$CBElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'isSelected': instance.isSelected,
    };

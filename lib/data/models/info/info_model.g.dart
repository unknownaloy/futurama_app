// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InfoModel _$$_InfoModelFromJson(Map<String, dynamic> json) => _$_InfoModel(
      id: json['id'] as int,
      synopsis: json['synopsis'] as String,
      yearsAired: json['yearsAired'] as String,
      creators: (json['creators'] as List<dynamic>)
          .map((e) => Creator.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InfoModelToJson(_$_InfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'synopsis': instance.synopsis,
      'yearsAired': instance.yearsAired,
      'creators': instance.creators.map((e) => e.toJson()).toList(),
    };

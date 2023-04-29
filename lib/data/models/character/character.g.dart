// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Character _$$_CharacterFromJson(Map<String, dynamic> json) => _$_Character(
      id: json['id'] as int,
      characterName:
          CharacterName.fromJson(json['name'] as Map<String, dynamic>),
      characterImage:
          CharacterImage.fromJson(json['images'] as Map<String, dynamic>),
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.male,
      species: json['species'] as String,
      homePlanet: json['homePlanet'] as String?,
      occupation: json['occupation'] as String,
      sayings:
          (json['sayings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CharacterToJson(_$_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.characterName.toJson(),
      'images': instance.characterImage.toJson(),
      'gender': _$GenderEnumMap[instance.gender]!,
      'species': instance.species,
      'homePlanet': instance.homePlanet,
      'occupation': instance.occupation,
      'sayings': instance.sayings,
    };

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
};

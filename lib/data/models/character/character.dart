import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:futurama_app/data/enums/gender.dart';
import 'package:futurama_app/data/models/character/character_image.dart';
import 'package:futurama_app/data/models/character/character_name.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  @JsonSerializable(explicitToJson: true)
  factory Character({
    @JsonKey(name: "name") required CharacterName characterName,
    @JsonKey(name: "images") required CharacterImage characterImage,
    @Default(Gender.male) Gender gender,
    required String species,
    String? homePlanet,
    required String occupation,
    required List<String> sayings,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

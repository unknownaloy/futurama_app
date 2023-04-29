import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_name.freezed.dart';
part 'character_name.g.dart';

@freezed
class CharacterName with _$CharacterName {
  factory CharacterName({
    required String first,
    required String middle,
    required String last,
  }) = _CharacterName;

  factory CharacterName.fromJson(Map<String, dynamic> json) =>
      _$CharacterNameFromJson(json);
}

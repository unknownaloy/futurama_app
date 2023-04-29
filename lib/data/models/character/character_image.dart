import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:futurama_app/data/models/character/character_name.dart';

part 'character_image.freezed.dart';
part 'character_image.g.dart';

@freezed
class CharacterImage with _$CharacterImage {
  factory CharacterImage({
    @JsonKey(name: "main") required String image,
  }) = _CharacterImage;

  factory CharacterImage.fromJson(Map<String, dynamic> json) =>
      _$CharacterImageFromJson(json);
}

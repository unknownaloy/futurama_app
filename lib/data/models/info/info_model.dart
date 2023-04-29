import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:futurama_app/data/models/info/creator/creator.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
class InfoModel with _$InfoModel {
  @JsonSerializable(explicitToJson: true)
  factory InfoModel({
    required int id,
    required String synopsis,
    required String yearsAired,
    required List<Creator> creators,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}

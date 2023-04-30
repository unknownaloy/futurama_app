import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  @JsonSerializable(explicitToJson: true)
  factory Question({
    required int id,
    required String question,
    required List<String> possibleAnswers,
    required Object correctAnswer,
    @JsonKey(defaultValue: false) bool? isSelected,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

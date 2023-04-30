import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  @JsonSerializable(explicitToJson: true)
  factory Question({
    required int id,
    String? question,
    List<String>? possibleAnswers,
    Object? correctAnswer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

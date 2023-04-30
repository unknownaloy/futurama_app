import 'package:flutter/foundation.dart';
import 'package:futurama_app/data/models/question/question.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/utilities/failure.dart';

class QuizViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  QuizViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  RequestState _requestState = const RequestState.idle();
  RequestState get requestState => _requestState;

  List<Question> _quizQuestions = [];
  List<Question> get quizQuestions => [..._quizQuestions];

  Future<void> fetchQuizQuestions() async {
    try {
      _requestState = const RequestState.idle();

      _quizQuestions = await _apiServices.getQuestions();

      _requestState = const RequestState.success();
    } on Failure catch (err) {
      _requestState = RequestState.error(message: err.message);
    } finally {
      notifyListeners();
    }
  }
}

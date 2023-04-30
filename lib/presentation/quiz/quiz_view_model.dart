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

  int _correctAnswer = 0;
  int get correctAnswer => _correctAnswer;

  List<String> _selectedAnswers = [];
  List<String> get selectedAnswer => [..._selectedAnswers];

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

  void handleAnswerSelection({
    required int index,
    required String answer,
  }) {
    if ((_selectedAnswers.length - 1) < index) {
      _selectedAnswers.add(answer);
      notifyListeners();
      return;
    }

    _selectedAnswers[index] = answer;
    notifyListeners();
  }

  bool getSelectedAnswer({
    required int index,
    required String answer,
  }) {
    if (_selectedAnswers.length - 1 >= index) {
      return _selectedAnswers[index] == answer;
    }

    return false;
  }

  void checkAnswer(int index) {
    if (_selectedAnswers[index] == _quizQuestions[index].correctAnswer) {
      _correctAnswer++;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _correctAnswer = 0;
    _selectedAnswers = [];

    notifyListeners();
  }
}

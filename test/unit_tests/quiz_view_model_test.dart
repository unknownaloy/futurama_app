import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_app/data/models/question/question.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/presentation/quiz/quiz_view_model.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

void main() {
  late QuizViewModel sut;
  late MockApiServices mockApiServices;

  setUp(() {
    mockApiServices = MockApiServices();

    sut = QuizViewModel(apiServices: mockApiServices);
  });

  final quizData = [
    Question(
      id: 1,
      question: "The quick brown fox",
      possibleAnswers: ["Apple", "Banana", "Crab"],
      correctAnswer: "Apple",
    ),
    Question(
      id: 2,
      question: "The quick brown fox jumps over the lazy dog",
      possibleAnswers: ["Dog", "Elephant", "Fish"],
      correctAnswer: "Dog",
    ),
  ];

  void initializeQuizViewModelWithData() {
    when(mockApiServices.getQuestions()).thenAnswer((_) async => quizData);
  }

  test("Test that initial values are correct", () {
    expect(sut.requestState, const RequestState.idle());
    expect(sut.quizQuestions, []);
    expect(sut.correctAnswer, 0);
    expect(sut.selectedAnswer, []);
  });

  group("fetchQuizQuestions", () {
    test("fetchCharacters uses the mockApiServices", () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();
      verify(mockApiServices.getQuestions()).called(1);
    });

    test("""indicates loading of data, 
    set quiz questions to the one gotten from the service,
    indicates that the data is not being loaded anymore""", () async {
      initializeQuizViewModelWithData();
      final future = sut.fetchQuizQuestions();
      expect(sut.requestState, const RequestState.loading());
      await future;

      expect(sut.requestState, const RequestState.success());
      expect(sut.quizQuestions, quizData);
      expect(sut.correctAnswer, 0);
      expect(sut.selectedAnswer, []);
    });
  });

  group("test handleAnswerSelection", () {
    test(
        "handleAnswerSelection for initial selection when _selectedAnswers is empty",
        () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();

      sut.handleAnswerSelection(index: 0, answer: "Apple");

      expect(sut.selectedAnswer[0], "Apple");
    });

    test("""handleAnswerSelection, 
    Test when the user has previously made a selection and changes their answer,""",
        () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();

      sut.handleAnswerSelection(index: 0, answer: "Apple");

      sut.handleAnswerSelection(index: 0, answer: "Banana");

      expect(sut.selectedAnswer[0], "Banana");
    });
  });

  group("test getSelectedAnswer", () {
    test("""getSelectedAnswer, 
    getSelectedAnswer return false is not selections has been made,""",
        () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();

      bool result = sut.getSelectedAnswer(index: 0, answer: "Apple");

      expect(result, false);
    });

    test("""getSelectedAnswer, 
    Should return true if a selection has previously been made for the question,""",
        () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();

      sut.handleAnswerSelection(index: 0, answer: "Apple");

      bool result = sut.getSelectedAnswer(index: 0, answer: "Apple");

      expect(result, true);
    });
  });

  group("test checkAnswer", () {
    test("""checkAnswer, 
    Testing the value of _correctAnswer when no selections have been made,""",
        () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();

      sut.checkAnswer(0);

      expect(sut.correctAnswer, 0);
    });

    test("""checkAnswer, 
    Testing the value of _correctAnswer when a selection have been made,
    and the answer is correct""", () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();

      sut.handleAnswerSelection(index: 0, answer: "Apple");

      sut.checkAnswer(0);

      expect(sut.correctAnswer, 1);
    });

    test("""checkAnswer, 
    Testing the value of _correctAnswer when a selection have been made,
    and the answer is wrong""", () async {
      initializeQuizViewModelWithData();

      await sut.fetchQuizQuestions();

      sut.handleAnswerSelection(index: 0, answer: "Banana");

      sut.checkAnswer(0);

      expect(sut.correctAnswer, 0);
    });
  });

  test("""resetQuiz, 
    Test that values are reset properly""", () async {
    sut.resetQuiz();

    expect(sut.correctAnswer, 0);
    expect(sut.selectedAnswer, []);
  });
}

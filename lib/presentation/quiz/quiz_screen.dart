import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/quiz/components/question_card.dart';
import 'package:futurama_app/presentation/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with AutomaticKeepAliveClientMixin {
  late final PageController _pageController;

  void _forwardQuizHandler(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    context.read<QuizViewModel>().fetchQuizQuestions();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<QuizViewModel>(
      builder: (_, model, __) => model.requestState.maybeWhen(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (message) => Center(
          child: Text(message),
        ),
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
        success: (data) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Quiz",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.quizQuestions.length,
            itemBuilder: (BuildContext context, int index) {
              final question = model.quizQuestions[index];
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Question ${index + 1}",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: const Color(0xffF2BC8C),
                                  ),
                        ),
                        Text(
                          "Score: ${model.correctAnswer}/${model.quizQuestions.length}",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: const Color(0xffF2BC8C),
                                  ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      question.question,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    /// Possible answers
                    ...question.possibleAnswers.map(
                      (possibleAnswer) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: QuestionCard(
                          possibleAnswer: possibleAnswer,
                          isSelected: model.getSelectedAnswer(
                            index: index,
                            answer: possibleAnswer,
                          ),
                          onSelected: (selectedAnswer) =>
                              model.handleAnswerSelection(
                            index: index,
                            answer: selectedAnswer,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 48,
                    ),

                    TextButton(
                      onPressed: () {
                        model.checkAnswer(index);

                        if (index == model.quizQuestions.length -1) {
                          // Navigate to result view
                          return;
                        }

                        _forwardQuizHandler(index + 1);
                      },
                      child: Text(
                        index == model.quizQuestions.length - 1
                            ? "Submit"
                            : "Next",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/quiz/components/question_card.dart';
import 'package:futurama_app/presentation/quiz/quiz_view_model.dart';
import 'package:futurama_app/presentation/quiz/screens/result_screen.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final PageController _pageController;

  late final AnimationController _animationController;
  late final Animation<Offset> _animation;

  bool _isSelected = false;

  void _forwardQuizHandler(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _animation =
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _pageController = PageController();

    context.read<QuizViewModel>().fetchQuizQuestions();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();

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
        success: () {
          _animationController.forward();
          return Scaffold(
            appBar: AppBar(
              title: Semantics(
                label: "Quiz",
                header: true,
                child: Text(
                  "Quiz",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: const Color(0xffF2BC8C),
                                ),
                            semanticsLabel: "Question ${index + 1}",
                          ),
                          Semantics(
                            label:
                                'Score: ${model.correctAnswer} out of ${model.quizQuestions.length}',
                            value:
                                'Score: ${model.correctAnswer} out of ${model.quizQuestions.length}',
                            child: Text(
                              "Score: ${model.correctAnswer}/${model.quizQuestions.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: const Color(0xffF2BC8C),
                                  ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      Semantics(
                        label: question.question,
                        readOnly: true,
                        textDirection: TextDirection.ltr,
                        child: Text(
                          question.question,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      /// Possible answers
                      ...question.possibleAnswers.map(
                        (possibleAnswer) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return SlideTransition(
                                position: _animation,
                                child: QuestionCard(
                                  possibleAnswer: possibleAnswer,
                                  isSelected: model.getSelectedAnswer(
                                    index: index,
                                    answer: possibleAnswer,
                                  ),
                                  onSelected: (selectedAnswer) {
                                    setState(() => _isSelected = true);
                                    model.handleAnswerSelection(
                                      index: index,
                                      answer: selectedAnswer,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 48,
                      ),

                      TextButton(
                        onPressed: () {
                          if (!_isSelected) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text("Kindly select an answer"),
                                  duration: Duration(milliseconds: 700),
                                ),
                              );

                            return;
                          }

                          model.checkAnswer(index);

                          if (index == model.quizQuestions.length - 1) {
                            // Navigate to the result's screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                  onReset: () {
                                    model.resetQuiz();
                                    _pageController.jumpToPage(0);
                                  },
                                ),
                              ),
                            );
                            return;
                          }

                          _forwardQuizHandler(index + 1);
                          _animationController
                            ..reset()
                            ..forward();

                          setState(() => _isSelected = false);
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
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.onReset,
  }) : super(key: key);

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<QuizViewModel>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "RESULT",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 40,
                        ),
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Score: ',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: const Color(0xff7AC7C3)),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${viewModel.correctAnswer}/${viewModel.quizQuestions.length}',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: const Color(0xff7AC7C3)),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {
                      onReset();
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Restart",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Icon(
                          Icons.restart_alt_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

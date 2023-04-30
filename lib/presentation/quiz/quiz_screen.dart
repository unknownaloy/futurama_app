import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/quiz/quiz_view_model.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    context.read<QuizViewModel>().fetchQuizQuestions();
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
        success: (data) => Text("Success"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

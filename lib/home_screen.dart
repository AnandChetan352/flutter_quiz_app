import 'package:flutter/material.dart';
import 'package:quiz_app/text_widget';

class QuizHome extends StatelessWidget {
  const QuizHome(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(140, 255, 255, 255),
          ),
          const SizedBox(height: 20),
          const TextWidget("Learn Flutter The Fun Way!"),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: onPressedElevated,
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            label: const TextWidget('Start Quiz'),
          ),
        ],
      ),
    );
  }

  void onPressedElevated() {
    //Quiz Starts Here
    startQuiz();
  }
}

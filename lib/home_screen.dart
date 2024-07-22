import 'package:flutter/material.dart';
import 'package:quiz_app/text_widget';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.purple.shade200,
        Colors.purple.shade500,
        Colors.purple.shade900
      ])),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 200,
            ),
            const SizedBox(height: 15),
            const TextWidget(
              "Learn Flutter The Fun"),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 10),
              ),
              onPressed: null,
              child: const TextWidget("Start Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/text_widget';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseAnswer,{super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionsIndex = 0;

  void answerQuestion(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      if (currentQuestionsIndex < questions.length-1) {
        currentQuestionsIndex++;
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentQuestionsIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextWidget(currentQuestions.text),
            const SizedBox(height: 30),
            ...currentQuestions.getShuffeledAnswers().map((answer) {
              return AnswerButton(answer, ()
              {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}

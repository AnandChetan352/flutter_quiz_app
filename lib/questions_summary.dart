import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return QuetionNumberWidget(data);
          }).toList(),
        ),
      ),
    );
  }
}

class QuetionNumberWidget extends StatelessWidget {
  const QuetionNumberWidget(this.data, {super.key});
  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final int questionIndex = (data['question_index'] as int) + 1;
    final String question = (data['question'] as String);
    final String userAnswer = (data['user_answer'] as String);
    final String correctAnswer = (data['correct_answer'] as String);
    final bool isAnswerCorrect = correctAnswer == userAnswer;
    final color = isAnswerCorrect ? Colors.green.shade500 : Colors.red.shade500;

    return Row(
      
      children: [
      Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Text(
            questionIndex.toString(),
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 15,
            ),
          )),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            Text(
              "Expected : $correctAnswer",
              style: GoogleFonts.workSans(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 2),
            Text("Actual : $userAnswer",
            style: GoogleFonts.workSans(
                color: color,
                fontSize: 15,
              ),
              textAlign: TextAlign.left),
            const SizedBox(height: 2),
          ],
        ),
      ),
    ]);
  }
}

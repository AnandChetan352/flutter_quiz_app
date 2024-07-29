import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/text_widget';

class ResultScreen extends StatelessWidget
{
  const ResultScreen(this.choosenAnswer, this.restartQuiz,{super.key});
  final List<String> choosenAnswer;
  final void Function() restartQuiz; 
  
  List<Map<String,Object>> getSummarydata()
  {
    final List<Map<String,Object>> summary = [];
    for (var i = 0; i< choosenAnswer.length; i++)
    {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswer[i]
        });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummarydata();
    final totalQuestions = questions.length;
    
    final correctQuestions = summaryData.where((data)
    { return
      data['correct_answer'] == data['user_answer']; }).length;


    return SizedBox
    (
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
        [
          TextWidget("You answered $correctQuestions out of $totalQuestions questions"),
          const SizedBox(height: 30),
          QuestionsSummary(summaryData),
          const SizedBox(height: 30),
          TextButton(onPressed: restartQuiz, child: const TextWidget("Restart Quiz"))
        ],),
      ),
    );
  }
}
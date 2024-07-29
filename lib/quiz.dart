import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
List<String> selectedAnswers =[];
Widget? activeScreen;

@override
  void initState() {
    
    super.initState();
    activeScreen = QuizHome(switchScreen);
  }

void switchScreen()
{
  setState(() {
    activeScreen = QuestionsScreen(chooseAnswer);
  });
}

void restartQuiz()
{
  setState(() {
    activeScreen = QuestionsScreen(chooseAnswer);
  });
}

void chooseAnswer(String answer)
{
  selectedAnswers.add(answer);
  if(selectedAnswers.length == questions.length)
  {
    //switch to results screen here
    setState(() {
      
      activeScreen = ResultScreen(selectedAnswers,restartQuiz);
      selectedAnswers = [];
    });
  }
}

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple.shade700,
                Colors.deepPurpleAccent.shade400
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

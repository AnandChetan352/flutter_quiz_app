import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/text_widget';

void main() {
  runApp( const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const TextWidget("Quiz App"),
          centerTitle: false,
          backgroundColor: Colors.deepPurple.shade400,
          surfaceTintColor: Colors.deepOrange,
          shadowColor: Colors.deepOrange,
        ),
        body: const Quiz(),
      ),
    );
  }
}

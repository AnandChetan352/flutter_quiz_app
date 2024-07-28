import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/text_widget';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.OnTap, {super.key});

  final String answerText;
  final void Function() OnTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: Colors.green.shade400,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      onPressed: OnTap,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}

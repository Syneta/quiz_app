import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 400,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
           Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(
              decoration: TextDecoration.none,
               fontSize: 25,
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white70,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            label: const Text('Start Quiz',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:next_level/start_screen.dart';
import 'package:next_level/questions_screen.dart';
import 'package:next_level/data/questions.dart';
import 'package:next_level/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.black87, Colors.grey],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

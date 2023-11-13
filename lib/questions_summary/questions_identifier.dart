import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    required this.isCorrectAnswer,
    required this.questionIndex,
    super.key,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.lightGreenAccent : Colors.redAccent,
        borderRadius: BorderRadius.circular(120),
      ),
      child: Text(questionNumber.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.black,
      ),),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:next_level/questions_summary/questions_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData,{super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question: \n${itemData['question'].toString()}',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your answer: ${itemData['user_answer'].toString()}',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.lightGreenAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Correct answer: ${itemData['correct_answer'].toString()}',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.cyanAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

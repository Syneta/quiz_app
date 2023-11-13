import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_level/data/questions.dart';
import 'package:next_level/questions_summary/summary_data.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfQuestions = questions.length;
    final numberOfCorrectQuestions = summaryData.where((element) {
      return element['correct_answer'] == element['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You got $numberOfCorrectQuestions out of $numberOfQuestions correct',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white70,
              ),
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text(
                'Restart quiz',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'You got x out of y questions correct',
            style: TextStyle(color: Colors.white54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }*/

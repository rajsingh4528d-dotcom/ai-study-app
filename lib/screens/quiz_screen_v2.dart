import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_result_screen.dart';

class QuizScreenV2 extends StatefulWidget {
  const QuizScreenV2({super.key});

  @override
  State<QuizScreenV2> createState() => _QuizScreenV2State();
}

class _QuizScreenV2State extends State<QuizScreenV2> {
  final List<Question> questions = [

    Question(
      question: "How many sides does a triangle have?",
      options: [
        "2",
        "3",
        "4",
        "5",
      ],
      correctAnswer: 1,
    ),

    Question(
      question: "How many months are there in one year?",
      options: [
        "10",
        "11",
        "12",
        "13",
      ],
      correctAnswer: 2,
    ),

    Question(
      question: "5 × 6 = ?",
      options: [
        "30",
        "35",
        "25",
        "20",
      ],
      correctAnswer: 0,
    ),

    Question(
      question: "Which number is even?",
      options: [
        "11",
        "13",
        "16",
        "19",
      ],
      correctAnswer: 2,
    ),

    Question(
      question: "100 ÷ 10 = ?",
      options: [
        "5",
        "10",
        "15",
        "20",
      ],
      correctAnswer: 1,
    ),
  ];

  int currentQuestion = 0;
  int score = 0;

  void checkAnswer(int index) {

    if (index == questions[currentQuestion].correctAnswer) {
      score++;
    }

    if (currentQuestion == questions.length - 1) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuizResultScreen(
            score: score,
            totalQuestions: questions.length,
          ),
        ),
      );

    } else {

      setState(() {
        currentQuestion++;
      });

    }

  }

  @override
  Widget build(BuildContext context) {

    final question = questions[currentQuestion];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Class 6 Quiz"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
            ),

            const SizedBox(height: 20),

            Text(
              "Question ${currentQuestion + 1} / ${questions.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              question.question,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ...List.generate(

              question.options.length,

              (index) {

                return Padding(

                  padding: const EdgeInsets.only(bottom: 15),

                  child: SizedBox(

                    width: double.infinity,

                    height: 55,

                    child: ElevatedButton(

                      onPressed: () => checkAnswer(index),

                      child: Text(
                        question.options[index],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),

                    ),

                  ),

                );

              },

            ),

          ],

        ),

      ),

    );

  }

}
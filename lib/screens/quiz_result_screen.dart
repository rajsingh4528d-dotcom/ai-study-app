import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  String getMessage() {
    double percent = (score / totalQuestions) * 100;

    if (percent >= 90) {
      return "🏆 Excellent!";
    } else if (percent >= 70) {
      return "🎉 Very Good!";
    } else if (percent >= 50) {
      return "👍 Good Job!";
    } else {
      return "📚 Keep Practicing!";
    }
  }

  Color getColor() {
    double percent = (score / totalQuestions) * 100;

    if (percent >= 90) {
      return Colors.green;
    } else if (percent >= 70) {
      return Colors.blue;
    } else if (percent >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Quiz Result"),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),

            child: Padding(
              padding: const EdgeInsets.all(30),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [

                  CircleAvatar(
                    radius: 45,
                    backgroundColor: getColor(),
                    child: const Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    getMessage(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    "$score / $totalQuestions",
                    style: TextStyle(
                      fontSize: 40,
                      color: getColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "You answered $score questions correctly.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        "Try Again",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/score_card.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Result"),
      ),
      body: Center(
        child: ScoreCard(
          score: score,
          total: total,
        ),
      ),
    );
  }
}
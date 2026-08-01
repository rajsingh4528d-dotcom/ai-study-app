import 'package:flutter/material.dart';

class QuizOptionCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const QuizOptionCard({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
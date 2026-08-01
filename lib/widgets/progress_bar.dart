import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;

  const ProgressBar({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: value,
          minHeight: 10,
        ),
        const SizedBox(height: 10),
        Text("${(value * 100).toInt()} % Completed"),
      ],
    );
  }
}
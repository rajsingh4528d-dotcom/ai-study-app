import 'package:flutter/material.dart';

void main() {
  runApp(const AIStudyApp());
}

class AIStudyApp extends StatelessWidget {
  const AIStudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AI Study App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AI Study App"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "🎉 AI Study App Working!",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  late final GenerativeModel _model;

  GeminiService() {
    String? apiKey;

    // Codemagic Environment Variable
    apiKey = Platform.environment['GEMINI_API_KEY'];

    // Local .env
    apiKey ??= dotenv.env['GEMINI_API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception("Gemini API Key Missing");
    }

    _model = GenerativeModel(
      model: "gemini-2.5-flash",
      apiKey: apiKey,
    );
  }

  Future<String> generateChapterNotes(
    String className,
    String subject,
    String chapter,
  ) async {
    try {
      final prompt = """
You are India's Best NCERT Teacher.

Teach students exactly like a school teacher.

Rules:
1. Explain in very easy English.
2. Follow NCERT syllabus.
3. Give NEW answer every time.
4. Never repeat previous response.
5. Use different examples every time.
6. Add practice questions.
7. Keep answer around 500-800 words.

Generate in this format:

📘 Chapter Introduction

📖 Easy Explanation

💡 Important Points

🌍 Real Life Examples

📝 Practice Questions (5)

⭐ Revision Notes

🎯 Summary

Class: $className

Subject: $subject

Chapter: $chapter

Current Time:
${DateTime.now()}
""";

      final response = await _model.generateContent([
        Content.text(prompt),
      ]);

      return response.text ?? "No response received.";
    } catch (e) {
      return "Error: $e";
    }
  }

  Future<String> sendMessage(String message) async {
    try {
      final prompt = """
You are AI Teacher.

Your job is to teach students.

Rules:
• Explain in very easy English.
• Answer step by step.
• Use simple examples.
• If Maths → solve stepwise.
• If Science → explain concept.
• If English → explain grammar.
• If History → explain like a story.
• End every answer with 3 practice questions.
• Never say "I am an AI model".

Student Question:

$message
""";

      final response = await _model.generateContent([
        Content.text(prompt),
      ]);

      return response.text ?? "No response received.";
    } catch (e) {
      return "Error: $e";
    }
  }
}
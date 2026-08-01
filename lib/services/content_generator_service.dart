import 'gemini_service.dart';

class ContentGeneratorService {
  final GeminiService _gemini = GeminiService();

  Future<String> generateChapter({
    required String className,
    required String subject,
    required String chapter,
  }) async {
    final prompt = """
You are an expert NCERT teacher.

Generate COMPLETE study material.

Class : $className

Subject : $subject

Chapter : $chapter

Write in SIMPLE ENGLISH.

Output Format

================================

NOTES

--------------------------------

EXAMPLES

--------------------------------

PRACTICE QUESTIONS

--------------------------------

SUMMARY

--------------------------------

FUN FACTS

--------------------------------

MCQ QUIZ
(5 Questions with Answers)

================================

Don't write any introduction.

Don't write markdown.

Don't use **

Return only study material.
""";

    return await _gemini.sendMessage(prompt);
  }
}
import 'package:flutter/material.dart';
import 'chapter_note_screen.dart';
import 'quiz_screen.dart';
import 'ai_chat_screen.dart';

class ChapterMenuScreen extends StatelessWidget {
  final String chapterTitle;

  const ChapterMenuScreen({
    super.key,
    required this.chapterTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapterTitle),
        centerTitle: true,
      ),
      body: ListView(
        children: [

          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text("📖 Notes"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChapterNoteScreen(
                    title: chapterTitle,
                    notes: "Notes of $chapterTitle will be added here.",
                  ),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.smart_toy),
            title: const Text("🤖 AI Explain"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AIChatScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.quiz),
            title: const Text("📝 Quiz"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const QuizScreen(),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../data/class6_math_chapters.dart';
import 'chapter_menu_screen.dart';

class Class6MathScreen extends StatelessWidget {
  const Class6MathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("📘 Class 6 Mathematics"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: class6MathChapters.length,
        itemBuilder: (context, index) {
          final chapter = class6MathChapters[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text(
                chapter.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChapterMenuScreen(
                      chapterTitle: chapter.title,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
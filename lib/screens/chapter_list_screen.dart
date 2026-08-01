import 'package:flutter/material.dart';
import '../data/notes/programming_c_notes.dart';
import 'chapter_note_screen.dart';

class ChapterListScreen extends StatelessWidget {
  const ChapterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chapters = [
      {"title": "Chapter 1"},
      {"title": "Chapter 2"},
      {"title": "Chapter 3"},
      {"title": "Chapter 4"},
      {"title": "Chapter 5"},
      {"title": "Chapter 6"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Programming in C"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapterTitle = chapters[index]["title"]!;

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(chapterTitle),
              subtitle: const Text("Tap to read notes"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChapterNoteScreen(
                      title: chapterTitle,
                      notes: programmingCNotes[chapterTitle] ??
                          "Notes Coming Soon",
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
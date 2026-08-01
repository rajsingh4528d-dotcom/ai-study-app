import 'package:flutter/material.dart';
import '../widgets/note_subject_card.dart';
import 'chapter_list_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("📚 Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search Subject...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [

                  NoteSubjectCard(
                    icon: Icons.code,
                    title: "Programming in C",
                    subtitle: "12 Chapters",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChapterListScreen(),
                        ),
                      );
                    },
                  ),

                  NoteSubjectCard(
                    icon: Icons.computer,
                    title: "Computer Fundamentals",
                    subtitle: "10 Chapters",
                    onTap: () {},
                  ),

                  NoteSubjectCard(
                    icon: Icons.calculate,
                    title: "Mathematics",
                    subtitle: "15 Chapters",
                    onTap: () {},
                  ),

                  NoteSubjectCard(
                    icon: Icons.storage,
                    title: "DBMS",
                    subtitle: "18 Chapters",
                    onTap: () {},
                  ),

                  NoteSubjectCard(
                    icon: Icons.language,
                    title: "Web Development",
                    subtitle: "14 Chapters",
                    onTap: () {},
                  ),

                  NoteSubjectCard(
                    icon: Icons.smart_toy,
                    title: "Artificial Intelligence",
                    subtitle: "20 Chapters",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../data/school/class6/mathematics/mathematics_data.dart';
import '../models/chapter_content.dart';

import 'chapter_note_screen.dart';
import 'examples_screen.dart';
import 'practice_screen.dart';
import 'summary_screen.dart';
import 'fun_facts_screen.dart';
import 'ai_explain_screen.dart';
import 'quiz_screen_v2.dart';

class ChapterDetailsScreen extends StatelessWidget {
  final String chapterTitle;

  const ChapterDetailsScreen({
    super.key,
    required this.chapterTitle,
  });

  ChapterContent get chapter {
    return mathematicsData.firstWhere(
      (c) => c.title == chapterTitle,
      orElse: () => mathematicsData.first,
    );
  }

  Widget buildCard({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: Text(chapter.title),
        centerTitle: true,
      ),

      body: ListView(
        children: [

          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "📚 Class 6 Mathematics",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  chapter.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const LinearProgressIndicator(
                  value: 0.35,
                  minHeight: 8,
                ),

                const SizedBox(height: 10),

                const Text(
                  "35% Completed",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),

          buildCard(
            context: context,
            icon: Icons.menu_book,
            color: Colors.blue,
            title: "Read Notes",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChapterNoteScreen(
                    title: chapter.title,
                    notes: chapter.notes,
                  ),
                ),
              );
            },
          ),

          buildCard(
            context: context,
            icon: Icons.lightbulb,
            color: Colors.orange,
            title: "Examples",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamplesScreen(
                    title: chapter.title,
                    examples: chapter.examples,
                  ),
                ),
              );
            },
          ),

          buildCard(
            context: context,
            icon: Icons.assignment,
            color: Colors.green,
            title: "Practice Questions",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PracticeScreen(
                    title: chapter.title,
                    questions: chapter.practice,
                  ),
                ),
              );
            },
          ),

          buildCard(
            context: context,
            icon: Icons.star,
            color: Colors.deepPurple,
            title: "Summary",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SummaryScreen(
                    title: chapter.title,
                    summary: chapter.summary,
                  ),
                ),
              );
            },
          ),

          buildCard(
            context: context,
            icon: Icons.emoji_objects,
            color: Colors.amber,
            title: "Fun Facts",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FunFactsScreen(
                    title: chapter.title,
                    facts: chapter.funFacts,
                  ),
                ),
              );
            },
          ),

          buildCard(
            context: context,
            icon: Icons.smart_toy,
            color: Colors.teal,
            title: "AI Explain",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AIExplainScreen(
                    title: chapter.title,
                    notes: chapter.notes,
                  ),
                ),
              );
            },
          ),

          buildCard(
            context: context,
            icon: Icons.quiz,
            color: Colors.red,
            title: "MCQ Quiz",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const QuizScreenV2(),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }
}
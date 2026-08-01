import 'package:flutter/material.dart';
import '../data/class6_subjects.dart';
import '../widgets/subject_card.dart';
import 'chapter_screen_v2.dart';

class SubjectScreen extends StatelessWidget {
  final String classId;
  final String className;

  const SubjectScreen({
    super.key,
    required this.classId,
    required this.className,
  });

  @override
  Widget build(BuildContext context) {
    final subjects = class6Subjects;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: Text("$className Subjects"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  className,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Select your subject",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subjects.length,

              itemBuilder: (context, index) {

                final subject = subjects[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),

                  child: SubjectCard(
                    title: subject.name,
                    chapters: subject.chapters,

                    onTap: () {

                      if (subject.id == "math") {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChapterScreenV2(),
                          ),
                        );

                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${subject.name} Coming Soon 🚀",
                            ),
                          ),
                        );

                      }

                    },

                  ),
                );

              },

            ),
          ),

        ],
      ),
    );
  }
}
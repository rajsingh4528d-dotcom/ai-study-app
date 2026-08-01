import 'package:flutter/material.dart';
import '../data/education_classes.dart';
import '../widgets/education_class_card.dart';
import 'subject_screen.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("School Education"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "🏫 School Classes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Choose your class",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: educationClasses.length,

              itemBuilder: (context, index) {

                final item = educationClasses[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),

                  child: EducationClassCard(

                    title: item.name,

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SubjectScreen(
                            classId: item.id,
                            className: item.name,
                          ),
                        ),
                      );

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
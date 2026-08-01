import 'package:flutter/material.dart';
import '../data/class6_subjects.dart';
import 'class6_math_screen.dart';

class Class6SubjectsScreen extends StatelessWidget {
  const Class6SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("📚 Class 6 Subjects"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: class6Subjects.length,
        itemBuilder: (context, index) {
          final subject = class6Subjects[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.menu_book),
              ),
              title: Text(
                subject.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (subject.name == "Mathematics") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Class6MathScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${subject.name} Module Coming Soon 🚀"),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
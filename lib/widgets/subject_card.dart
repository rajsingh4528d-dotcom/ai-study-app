import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {

  final String title;
  final int chapters;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.title,
    required this.chapters,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        leading: const Icon(Icons.book),

        title: Text(title),

        subtitle: Text("$chapters Chapters"),

        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: onTap,

      ),

    );

  }

}
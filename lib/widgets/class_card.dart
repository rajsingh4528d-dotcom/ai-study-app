import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {

  final String title;

  final VoidCallback onTap;

  const ClassCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        leading: const Icon(Icons.school),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );

  }
}
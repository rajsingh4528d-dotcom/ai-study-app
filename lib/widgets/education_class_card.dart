import 'package:flutter/material.dart';

class EducationClassCard extends StatelessWidget {

  final String title;
  final VoidCallback onTap;

  const EducationClassCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 3,

      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),

      child: ListTile(

        leading: const CircleAvatar(
          child: Icon(Icons.school),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),

        onTap: onTap,

      ),

    );

  }

}
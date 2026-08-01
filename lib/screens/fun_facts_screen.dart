import 'package:flutter/material.dart';

class FunFactsScreen extends StatelessWidget {
  final String title;
  final List<String> facts;

  const FunFactsScreen({
    super.key,
    required this.title,
    required this.facts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "🎯 Fun Facts",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Interesting facts related to this chapter.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: facts.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(
                      Icons.emoji_objects,
                      color: Colors.orange,
                    ),
                    title: Text(facts[index]),
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
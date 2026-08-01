import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final String title;
  final String summary;

  const SummaryScreen({
    super.key,
    required this.title,
    required this.summary,
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
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "⭐ Chapter Summary",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Quick revision before quiz.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    summary,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.check),
                  label: const Text(
                    "Revision Complete",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
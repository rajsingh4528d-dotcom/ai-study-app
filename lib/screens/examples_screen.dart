import 'package:flutter/material.dart';

class ExamplesScreen extends StatelessWidget {
  final String title;
  final List<String> examples;

  const ExamplesScreen({
    super.key,
    required this.title,
    required this.examples,
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
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "💡 Learn With Examples",
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
                  "Examples make learning easier.",
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
              itemCount: examples.length,
              itemBuilder: (context, index) {

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Text(
                            examples[index],
                            style: const TextStyle(
                              fontSize: 17,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text(
                    "Continue Learning",
                    style: TextStyle(
                      fontSize: 18,
                    ),
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
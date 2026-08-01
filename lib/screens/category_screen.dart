import 'package:flutter/material.dart';
import '../data/categories.dart';
import 'school_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Education Categories"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "📚 Choose Your Education",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Select your learning category",
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
              padding: const EdgeInsets.all(16),
              itemCount: categories.length,

              itemBuilder: (context, index) {

                final category = categories[index];

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 18),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: ListTile(

                    contentPadding: const EdgeInsets.all(16),

                    leading: CircleAvatar(
                      radius: 28,
                      child: Text(
                        category.emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),

                    title: Text(
                      category.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        category.subtitle,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),

                    trailing: const Icon(Icons.arrow_forward_ios),

                    onTap: () {

                      if (category.title == "School") {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SchoolScreen(),
                          ),
                        );

                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${category.title} Module Coming Soon 🚀",
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
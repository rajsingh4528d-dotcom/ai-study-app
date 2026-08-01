import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Progress"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.menu_book,color: Colors.blue),
                title: const Text("Mathematics"),
                subtitle: const Text("Completed 35%"),
                trailing: const Text("35%"),
              ),
            ),

            const SizedBox(height:15),

            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.science,color: Colors.green),
                title: const Text("Science"),
                subtitle: const Text("Completed 0%"),
                trailing: const Text("0%"),
              ),
            ),

            const SizedBox(height:15),

            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.language,color: Colors.orange),
                title: const Text("English"),
                subtitle: const Text("Completed 0%"),
                trailing: const Text("0%"),
              ),
            ),

            const SizedBox(height:30),

            const LinearProgressIndicator(
              value: 0.20,
              minHeight: 10,
            ),

            const SizedBox(height:15),

            const Text(
              "Overall Progress : 20%",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
            )

          ],
        ),
      ),
    );
  }
}
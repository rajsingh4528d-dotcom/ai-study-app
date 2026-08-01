import 'package:flutter/material.dart';
import '../services/content_generator_service.dart';

class ContentGeneratorScreen extends StatefulWidget {
  const ContentGeneratorScreen({super.key});

  @override
  State<ContentGeneratorScreen> createState() =>
      _ContentGeneratorScreenState();
}

class _ContentGeneratorScreenState
    extends State<ContentGeneratorScreen> {
  final classController = TextEditingController();
  final subjectController = TextEditingController();
  final chapterController = TextEditingController();

  final ContentGeneratorService generator =
      ContentGeneratorService();

  bool loading = false;
  String result = "";

  Future<void> generateContent() async {
    if (classController.text.isEmpty ||
        subjectController.text.isEmpty ||
        chapterController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Fill all fields"),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
      result = "";
    });

    try {
      final data = await generator.generateChapter(
        className: classController.text,
        subject: subjectController.text,
        chapter: chapterController.text,
      );

      setState(() {
        result = data;
      });
    } catch (e) {
      setState(() {
        result = e.toString();
      });
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Content Generator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: classController,
              decoration: const InputDecoration(
                labelText: "Class",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: "Subject",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: chapterController,
              decoration: const InputDecoration(
                labelText: "Chapter",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.auto_awesome),
                label: const Text(
                  "Generate",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: loading ? null : generateContent,
              ),
            ),

            const SizedBox(height: 20),

            if (loading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),

            if (!loading)
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      result.isEmpty
                          ? "Generated content will appear here..."
                          : result,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
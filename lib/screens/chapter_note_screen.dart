import 'package:flutter/material.dart';
import '../services/gemini_service.dart';

class ChapterNoteScreen extends StatefulWidget {
  final String title;
  final String notes;

  const ChapterNoteScreen({
    super.key,
    required this.title,
    required this.notes,
  });

  @override
  State<ChapterNoteScreen> createState() => _ChapterNoteScreenState();
}

class _ChapterNoteScreenState extends State<ChapterNoteScreen> {
  final GeminiService _gemini = GeminiService();

  bool loading = true;

  String aiNotes = "";

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    final result = await _gemini.generateChapterNotes(
      "Class 6",
      "Mathematics",
      widget.title,
    );

    setState(() {
      aiNotes = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [

                  Expanded(
                    child: SingleChildScrollView(
                      child: SelectableText(
                        aiNotes,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        "Generate Again",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });

                        loadNotes();
                      },
                    ),
                  ),
            ],
          ),
        ),
    );
  }
}
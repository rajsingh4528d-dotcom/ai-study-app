import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/gemini_service.dart';
import '../services/voice_service.dart';

class AIExplainScreen extends StatefulWidget {
  final String title;
  final String notes;

  const AIExplainScreen({
    super.key,
    required this.title,
    required this.notes,
  });

  @override
  State<AIExplainScreen> createState() => _AIExplainScreenState();
}

class _AIExplainScreenState extends State<AIExplainScreen> {
  final GeminiService _gemini = GeminiService();
  final VoiceService _voice = VoiceService();

  bool loading = true;
  String explanation = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await _voice.init();
    await loadExplanation();
  }

  Future<void> loadExplanation() async {
    setState(() {
      loading = true;
    });

    final result = await _gemini.sendMessage("""
You are India's Best NCERT Teacher.

Explain Class 6 Mathematics chapter in very easy English.

Chapter:
${widget.title}

Rules:

• Easy English
• Step by Step
• Real Life Example
• Tricks
• Important Points
• Summary
• Practice Questions
""");

    setState(() {
      explanation = result;
      loading = false;
    });
  }

  @override
  void dispose() {
    _voice.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [

          IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: explanation),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Copied"),
                ),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: loadExplanation,
          ),

        ],
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          FloatingActionButton(
            heroTag: "speak",
            onPressed: () {
              _voice.speak(explanation);
            },
            child: const Icon(Icons.volume_up),
          ),

          const SizedBox(height: 12),

          FloatingActionButton(
            heroTag: "stop",
            backgroundColor: Colors.red,
            onPressed: () {
              _voice.stop();
            },
            child: const Icon(Icons.stop),
          ),

        ],
      ),

      body: loading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CircularProgressIndicator(),

                  SizedBox(height: 20),

                  Text(
                    "AI Teacher is preparing explanation...",
                    style: TextStyle(fontSize: 18),
                  ),

                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: SelectableText(
                  explanation,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.8,
                  ),
                ),
              ),
            ),
    );
  }
}
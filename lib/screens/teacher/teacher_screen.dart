import 'package:flutter/material.dart';
import '../../services/gemini_service.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  final GeminiService _gemini = GeminiService();
  final TextEditingController _controller = TextEditingController();

  String answer = "";
  bool isLoading = false;

  Future<void> askAI() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      isLoading = true;
      answer = "";
    });

    final result = await _gemini.sendMessage(_controller.text);

    setState(() {
      answer = result;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🤖 AI Teacher"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Ask any question...\nExample: Explain Photosynthesis",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : askAI,
                icon: const Icon(Icons.smart_toy),
                label: const Text("Ask AI"),
              ),
            ),

            const SizedBox(height: 20),

            if (isLoading)
              const CircularProgressIndicator(),

            if (!isLoading)
              Expanded(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        answer.isEmpty
                            ? "AI answer will appear here..."
                            : answer,
                        style: const TextStyle(fontSize: 16),
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../widgets/message_bubble.dart';
import '../services/voice_service.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
 State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final VoiceService _voiceService = VoiceService();

  bool isListening = false;

  @override
  void initState() {
    super.initState();
    _voiceService.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    _controller.clear();

    await context.read<ChatProvider>().sendMessage(text);
  }

  Future<void> _startListening() async {
    bool available = await _voiceService.initializeSpeech();

    if (!available) return;

    setState(() {
      isListening = true;
    });

    await _voiceService.startListening((text) {
      setState(() {
        _controller.text = text;
      });
    });
  }

  Future<void> _stopListening() async {
    await _voiceService.stopListening();

    setState(() {
      isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("🤖 AI Teacher"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<ChatProvider>().clearChat();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: chatProvider.messages.isEmpty
                    ? const Center(
                        child: Text(
                          "👋 Welcome!\nAsk your NCERT doubts.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: chatProvider.messages.length,
                        itemBuilder: (context, index) {
                          return MessageBubble(
                            message: chatProvider.messages[index],
                          );
                        },
                      ),
              ),

              if (chatProvider.isLoading)
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isListening ? Icons.mic : Icons.mic_none,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        if (isListening) {
                          _stopListening();
                        } else {
                          _startListening();
                        }
                      },
                    ),

                    Expanded(
                      child: TextField(
                        controller: _controller,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _sendMessage(),
                        decoration: InputDecoration(
                          hintText: "Ask your doubt...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed:
                          chatProvider.isLoading ? null : _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
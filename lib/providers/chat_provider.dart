import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../services/gemini_service.dart';

class ChatProvider extends ChangeNotifier {
  final GeminiService _geminiService = GeminiService();

  final List<ChatMessage> _messages = [];

  bool _isLoading = false;

  List<ChatMessage> get messages => _messages;

  bool get isLoading => _isLoading;

  void clearChat() {
    _messages.clear();
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    _messages.add(
      ChatMessage(
        text: text,
        isUser: true,
      ),
    );

    _isLoading = true;
    notifyListeners();

    try {
      final reply = await _geminiService.sendMessage(text);

      _messages.add(
        ChatMessage(
          text: reply,
          isUser: false,
        ),
      );
    } catch (e) {
      _messages.add(
        ChatMessage(
          text: "❌ Error: $e",
          isUser: false,
        ),
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
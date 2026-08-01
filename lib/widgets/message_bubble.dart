import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/chat_message.dart';
import '../services/voice_service.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final VoiceService voice = VoiceService();

    return Align(
      alignment:
          message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(maxWidth: 330),
        decoration: BoxDecoration(
          color: message.isUser
              ? Colors.blue
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              message.text,
              style: TextStyle(
                color:
                    message.isUser ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),

            if (!message.isUser)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  IconButton(
                    icon: const Icon(
                      Icons.volume_up,
                      size: 20,
                    ),
                    onPressed: () async {
                      await voice.init();
                      await voice.speak(message.text);
                    },
                  ),

                  IconButton(
                    icon: const Icon(
                      Icons.copy,
                      size: 20,
                    ),
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: message.text),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Copied"),
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
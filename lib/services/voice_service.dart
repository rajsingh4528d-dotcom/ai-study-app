import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  final FlutterTts flutterTts = FlutterTts();
  final SpeechToText speechToText = SpeechToText();

  Future<void> init() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.45);
    await flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text) async {
    await flutterTts.stop();
    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }

  Future<bool> initializeSpeech() async {
    return await speechToText.initialize();
  }

  Future<void> startListening(Function(String) onResult) async {
    await speechToText.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
  }

  Future<void> stopListening() async {
    await speechToText.stop();
  }
}
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart'; // Add uuid package for unique message IDs

class ChatController extends GetxController {
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isLoading = false.obs;

  // Example: Replace with real user age later if needed
  final RxInt userAge = 21.obs;

  final String apiUrl = "http://192.168.0.107:8000/generate_response";

  Future<void> sendMessage({
    required String text,
    String? mood,
    int? age,
    String? reason,
  }) async {
    if (text.trim().isEmpty) return;

    // Add user message with unique ID
    final userMessage = ChatMessage.user(text);
    messages.add(userMessage);
    isLoading.value = true;

    try {
      final detectedMood = mood ?? detectMoodFromText(text);

      // Build conversation history: include last 5 messages (adjust as needed)
      final conversationHistory = messages
          .asMap()
          .entries
          .where((entry) => !entry.value.isLoading && !entry.value.isError)
          .toList()
          .reversed
          .take(5)
          .map((entry) => {
        'id': entry.value.id,
        'role': entry.value.isUser ? 'user' : 'assistant',
        'content': entry.value.message,
      })
          .toList()
          .reversed
          .toList();

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "mood": detectedMood,
          "age": age ?? userAge.value,
          "reason": reason ?? text,
          "user_id": "user_${DateTime.now().millisecondsSinceEpoch}",
          "input_text": text,
          "conversation_history": conversationHistory,
        }),
      ).timeout(const Duration(seconds: 10));

      _handleResponse(response);
    } on TimeoutException {
      _addErrorMessage('Request timed out. Please try again.');
    } on http.ClientException {
      _addErrorMessage('Network error. Check your internet connection.');
    } catch (e) {
      _addErrorMessage('An error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  String detectMoodFromText(String text) {
    text = text.toLowerCase();

    final moodKeywords = {
      'happy': ['happy', 'joy', 'excited', 'great', 'good'],
      'sad': ['sad', 'depressed', 'unhappy', 'cry', 'grief'],
      'angry': ['angry', 'mad', 'furious', 'annoyed'],
      'anxious': ['anxious', 'nervous', 'worried', 'stress'],
      'tired': ['tired', 'exhausted', 'fatigued', 'sleepy'],
    };

    for (final mood in moodKeywords.keys) {
      if (moodKeywords[mood]!.any((word) => text.contains(word))) {
        return mood;
      }
    }

    return 'neutral';
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        print('Server responded: ${response.body}');

        final reply = data['response'] ?? data['message'] ?? 'Sorry, I didn’t understand that.';
        final parts = reply.split('\n\n');

        if (parts.isNotEmpty) {
          // Show main part immediately
          messages.add(ChatMessage.bot(parts.first.trim()));

          if (parts.length > 1) {
            // Show typing indicator after 1.5 sec
            Future.delayed(const Duration(seconds: 1), () {
              messages.add(ChatMessage.loading());
            });

            // Show actual follow-up after 3.5 sec
            Future.delayed(const Duration(seconds: 3), () {
              // Remove the loading message
              messages.removeWhere((msg) => msg.isLoading);

              // Show follow-up content
              messages.add(ChatMessage.bot(parts.sublist(1).join('\n\n').trim()));
            });
          }
        }
      } catch (e) {
        _addErrorMessage('Failed to parse server response: ${e.toString()}');
      }
    } else {
      _addErrorMessage('Server error (${response.statusCode})');
    }
  }

  void _addErrorMessage(String message) {
    messages.add(ChatMessage.error(message));
  }
}

class ChatMessage {
  final String id; // Unique ID for each message
  final String message;
  final bool isUser;
  final bool isLoading;
  final bool isError;

  ChatMessage({
    String? id,
    required this.message,
    this.isUser = false,
    this.isLoading = false,
    this.isError = false,
  }) : id = id ?? const Uuid().v4(); // Generate unique ID if not provided

  factory ChatMessage.user(String msg) => ChatMessage(message: msg, isUser: true);
  factory ChatMessage.bot(String msg) => ChatMessage(message: msg);
  factory ChatMessage.error(String msg) => ChatMessage(message: msg, isError: true);
  factory ChatMessage.loading() => ChatMessage(message: '...', isLoading: true);
}
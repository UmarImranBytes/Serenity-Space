// chat_controller.dart
import 'package:get/get.dart';
import 'dart:async';

class ChatController extends GetxController {
  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message
    messages.add(ChatMessage(message: text, isUser: true));

    // Add loading indicator for AI response
    messages.add(ChatMessage(message: '...', isUser: false, isLoading: true));

    // Simulate API delay
    await Future.delayed(Duration(milliseconds: 500));

    // Replace loading with actual response
    messages.removeLast();
    messages.add(ChatMessage(message: "AI response: How can I help you?", isUser: false));
  }
}

class ChatMessage {
  final String message;
  final bool isUser;
  final bool isLoading;

  ChatMessage({required this.message, required this.isUser, this.isLoading = false});
}


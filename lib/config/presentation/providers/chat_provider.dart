import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola Quacks', fromWho: FromWho.me),
    Message(text: 'Que rollo', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
  }
}

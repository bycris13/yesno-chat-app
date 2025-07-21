import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      hisReplay();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInQuad,
    );
  }

  Future<void> hisReplay() async {
    final hisMessage = await getYesNoAnswer.getAnswer();

    messageList.add(hisMessage);
    notifyListeners();

    moveScrollToBottom();
  }
}

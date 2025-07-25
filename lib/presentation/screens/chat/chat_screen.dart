import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/massage_field_box.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://static.wikia.nocookie.net/karmaland/images/7/75/Quackity_%28Apariencia%29.png/revision/latest?cb=20220924001006&path-prefix=es',
            ),
          ),
        ),
        title: const Text('Quackity 🖤'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.me)
                      ? MyMessageBubble(message: message)
                      : HisMessageBubble(message: message);
                },
              ),
            ),

            // Caja de texto de mensajes.
            MassageFieldBox(
              // Forma larga de enviar el valor.
              onValue: (value) => chatProvider.sendMessage(value),
              // De esta forma solo se pasa la referencia a la funcion porque el valor que se envia dentro tiene la misma cantidad de argumentos.
              // onValue: chatProvider.sendMessage,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

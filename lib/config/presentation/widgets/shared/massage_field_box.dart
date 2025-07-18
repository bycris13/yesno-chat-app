import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/presentation/providers/chat_provider.dart';

class MassageFieldBox extends StatelessWidget {
  const MassageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;
    final chatProvider = context.watch<ChatProvider>();
    // Define un borde personalizado reutilizable con color primario y bordes redondeados
    final outlineInputBorder = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30),
    );
    final inputDecorationTheme = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      hintText: 'End your message with "?" ',
      // filled: true → activa el color de fondo en el campo de texto.
      // Si no se pone, el fondo será transparente por defecto.
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          chatProvider.sendMessage(textValue);
          textController.clear();
        },
        icon: const Icon(Icons.send),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onTapOutside: (event) =>
            focusNode.unfocus(), // Baja el teclado al oprimir afuera de este.
        decoration: inputDecorationTheme,
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus();
          chatProvider.sendMessage(value);
        },
      ),
    );
  }
}

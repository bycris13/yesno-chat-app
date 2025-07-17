import 'package:flutter/material.dart';

class MassageFieldBox extends StatelessWidget {
  const MassageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
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
          print('Valor de la caja de text');
        },
        icon: const Icon(Icons.send),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        decoration: inputDecorationTheme,
        onFieldSubmitted: (value) => print("Submit: $value"),
        onChanged: (value) => print('onChange: $value'),
      ),
    );
  }
}

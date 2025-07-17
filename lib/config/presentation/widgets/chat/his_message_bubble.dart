import 'package:flutter/material.dart';

// Widget que representa una burbuja de mensaje recibido
class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      // Alinea los elementos hacia la izquierda
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contenedor que actúa como burbuja de texto
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // color secundario del tema para el fondo
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ), // espacio interno
            child: Text(
              'Hola mundo', // texto del mensaje
              style: TextStyle(color: Colors.white), // texto en color blanco
            ),
          ),
        ),
        const SizedBox(height: 10), // espacio entre la burbuja y la imagen
        // Imagen del API yesno.
        _ImageBubble(),

        const SizedBox(height: 10), // espacio debajo de la imagen
      ],
    );
  }
}

// Widget privado que muestra la imagen tipo GIF
class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño o dimeciones de la pantalla (ancho y alto)
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      // Corta la imagen con bordes redondeados
      borderRadius: BorderRadius.circular(
        20,
      ), // redondea las esquinas de la imagen
      child: Image.network(
        // Carga una imagen desde internet (API yesno.wtf)
        'https://yesno.wtf/assets/no/10-d5ddf3f82134e781c1175614c0d2bab2.gif',
        width: size.width * 0.6, // 60% del ancho de pantalla
        height: 150, // alto fijo
        fit: BoxFit.cover, // la imagen se recorta para llenar todo el espacio
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

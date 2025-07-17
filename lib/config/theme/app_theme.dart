import 'package:flutter/material.dart';

const Color customColors = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  customColors,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.blueGrey,
  Colors.pinkAccent,
  Colors.greenAccent,
];

// Clase que define el tema de la app
class AppTheme {
  final int slectedColor;

  AppTheme({required this.slectedColor})
    : assert(
        slectedColor >= 0 && slectedColor <= _colorThemes.length,
        'slectedColor must be between 0 and ${_colorThemes.length}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      // Aplica como color base el primero (customColors)
      colorSchemeSeed: _colorThemes[slectedColor],
    );
  }
}

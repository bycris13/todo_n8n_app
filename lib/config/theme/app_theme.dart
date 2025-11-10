import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Color> colorsList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor < colorsList.length,
        'Selected color must be greater than or equal to 0 and less than < ${colorsList.length}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.alexandriaTextTheme(),
    colorSchemeSeed: colorsList[selectedColor],
  );
}

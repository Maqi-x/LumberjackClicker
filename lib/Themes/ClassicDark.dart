import 'package:flutter/material.dart';

var ClassicDarkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  cardTheme: CardTheme(
    color: Color.fromARGB(97, 0, 0, 0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(193, 0, 1, 8),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color.fromARGB(255, 23, 99, 161);
      }
      return Colors.grey;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue;
      }
      return Colors.grey.shade800;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color.fromARGB(255, 39, 99, 204);
      }
      return Colors.grey;
    }),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: const Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.grey[300],
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF2196F3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: const Color.fromARGB(150, 66, 66, 66),
    selectedColor: Colors.blue,
    disabledColor: const Color.fromARGB(97, 117, 117, 117),
    secondarySelectedColor: Colors.blue.shade700,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.white70,
    ),
    brightness: Brightness.dark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  ),
);

import 'package:flutter/material.dart';

var ClassicLightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  cardTheme: CardTheme(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 2,
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black87),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color.fromARGB(255, 23, 99, 161);
      }
      return Colors.grey.shade300;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue.shade200;
      }
      return Colors.grey.shade400;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color.fromARGB(255, 39, 99, 204);
      }
      return Colors.grey.shade300;
    }),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.grey[800],
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
    backgroundColor: const Color.fromARGB(150, 240, 240, 240),
    selectedColor: Colors.blue.shade200,
    disabledColor: const Color.fromARGB(97, 200, 200, 200),
    secondarySelectedColor: Colors.blue.shade300,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    labelStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.black54,
    ),
    brightness: Brightness.light,
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

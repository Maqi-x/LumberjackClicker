import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lumberjack_clicker/GLOBAL.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'GLOBAL.dart';
// import 'package:provider/provider.dart';

Future<void> save<T>(String key, T value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  switch (value.runtimeType) {
    case String:
      await prefs.setString(key, value as String);
      break;
    case int:
      await prefs.setInt(key, value as int);
      break;
    case double:
      await prefs.setDouble(key, value as double);
      break;
    case bool:
      await prefs.setBool(key, value as bool);
      break;
    case const (List<String>):
      await prefs.setStringList(key, value as List<String>);
      break;
    default:
      throw UnsupportedError("Unsupported type");
  }
}

Future<T?> getOrNull<T>(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  switch (T) {
    case String:
      return prefs.getString(key) as T?;
    case int:
      return prefs.getInt(key) as T?;
    case double:
      return prefs.getDouble(key) as T?;
    case bool:
      return prefs.getBool(key) as T?;
    case const (List<String>):
      return prefs.getStringList(key) as T?;
    default:
      throw UnsupportedError("Unsupported type");
  }
}

Future<void> delAll() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

Future<T> get<T>(String key, T defaultValue) async {
  final T? value = await getOrNull<T>(key);
  return value ?? defaultValue;
}

int randInt(int x, int y) {
  if (x > y) {
    int tmp = x;
    x = y;
    y = tmp;
  }
  final random = Random();
  return random.nextInt(y - x + 1) + x;
}

double randDouble(double x, double y) {
  if (x > y) {
    double tmp = x;
    x = y;
    y = tmp;
  }
  final random = Random();
  return random.nextDouble() * (y - x) + x;
}

void lightVibration() {
  HapticFeedback.lightImpact();
}

void mediumVibration() {
  HapticFeedback.mediumImpact();
}

void heavyVibration() {
  HapticFeedback.heavyImpact();
}

void longVibration() async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(duration: 500);
  }
}

void customPatternVibration({int v1 = 300, int delay = 100, int v2 = 350}) async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(pattern: [0, v1, delay, v2]);
  }
}

void comboVibration() async {
  if (await Vibration.hasVibrator()) {
    await Future.delayed(Duration(milliseconds: 40));
    HapticFeedback.mediumImpact();
    await Future.delayed(Duration(milliseconds: 40));
    Vibration.vibrate(duration: 30, amplitude: 200);
    HapticFeedback.mediumImpact();
  }
}

Container genStatsPanel(GlobalState global) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: global.darktheme ? Colors.grey[900] : Colors.white70,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 8,
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        global.buildStat("Logs", global.logs, FontAwesomeIcons.tree),
        global.buildStat("Money", global.money, FontAwesomeIcons.moneyBill),
      ],
    ),
  );
}

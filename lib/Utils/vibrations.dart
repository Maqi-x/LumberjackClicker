import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';


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

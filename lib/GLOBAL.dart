import 'package:flutter/material.dart';
import 'package:lumberjack_clicker/utils.dart';
export 'package:provider/provider.dart';

class GlobalState extends ChangeNotifier {
  int _axePower = 1, _autoCollect = 0, _logs = 0, _money = 0, _exchangeRate = 0;
  bool _vibrationSwitch = true, _animationsSwitch = true, _darktheme = true;
  int _vibrationsPower = 2;
  int _lang = 1; // 1 = English, 0 = Polish
  int _defaultScreen = 1; // 0 = shop, 1 = clicker, 2 = settings

  int get axePower => _axePower;
  int get autoCollect => _autoCollect;
  int get logs => _logs;
  int get money => _money;
  int get exchangeRate => _exchangeRate;
  bool get vibrationSwitch => _vibrationSwitch;
  bool get animationsSwitch => _animationsSwitch;
  bool get darktheme => _darktheme;
  int get vibrationsPower => _vibrationsPower;
  int get lang => _lang;
  int get defaultScreen => _defaultScreen;

  set darktheme(bool value) {
    _darktheme = value;
    save('Settings/darktheme', value);
    notifyListeners();
  }

  set defaultScreen(int value) {
    _defaultScreen = value;
    save('Settings/defaultScreen', value);
    notifyListeners();
  }

  set lang(int value) {
    _lang = value;
    save('Settings/lang', value);
    notifyListeners();
  }

  set axePower(int value) {
    _axePower = value;
    notifyListeners();
  }

  set vibrationsPower(int value) {
    save('Settings/vibrationsPower', value);
    _vibrationsPower = value;
    notifyListeners();
  }

  set autoCollect(int value) {
    _autoCollect = value;
    notifyListeners();
  }

  set vibrationSwitch(bool value) {
    _vibrationSwitch = value;
    save('Settings/vibrationSwitch', value);
    notifyListeners();
  }

  set logs(int value) {
    _logs = value;
    save('Gamedata/logs', _logs);
    notifyListeners();
  }

  set money(int value) {
    _money = value;
    save('Gamedata/money', _money);
    notifyListeners();
  }

  set exchangeRate(int value) {
    _exchangeRate += value;
    notifyListeners();
  }

  set animationsSwitch(bool value) {
    _animationsSwitch = value;
    save('Settings/animationsSwitch', _animationsSwitch);
    notifyListeners();
  }

  void autoVibration([int ch = 0]) {
    if (!vibrationSwitch) return;
    switch (vibrationsPower + ch) {
      case 0:
        lightVibration();
        return;
      case 1:
        mediumVibration();
        return;
      case 2:
        heavyVibration();
        return;
      case 3:
        comboVibration();
        return;
      default:
        lightVibration();
    }
  }

  Future<void> refresh() async {
    logs = await get<int>('Gamedata/logs', 0);
    money = await get<int>('Gamedata/money', 0);
    animationsSwitch = await get<bool>('Settings/animationsSwitch', true);
    vibrationSwitch = await get<bool>('Settings/vibrationSwitch', true);
    vibrationsPower = await get<int>('Settings/vibrationsPower', 2);
    lang = await get<int>('Settings/lang', 1);
    defaultScreen = await get<int>('Settings/defaultScreen', 1);
    darktheme = await get<bool>('Settings/darktheme', true);
  }

  String Lang(String t1, String t2) {
    return lang == 0 ? t1 : t2;
  }

  Widget buildStat(String label, int value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: darktheme ? Colors.white : const Color.fromARGB(255, 0, 0, 0), size: 28),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, color: darktheme ? Colors.white : const Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: darktheme ? Colors.white : const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

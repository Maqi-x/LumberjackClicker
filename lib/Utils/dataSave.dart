import 'package:shared_preferences/shared_preferences.dart';


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

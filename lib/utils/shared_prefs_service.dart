import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Singleton
  SharedPrefsService._();
  static final SharedPrefsService _instance = SharedPrefsService._();
  static SharedPrefsService get instance => _instance;

  late SharedPreferences _preferences;

  Future<void> initSharedPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData({required String key, required dynamic value}) async {
    if (value is int) {
      await _preferences.setInt(key, value);
      return true;
    }
    if (value is double) {
      await _preferences.setDouble(key, value);
      return true;
    }
    if (value is bool) {
      await _preferences.setBool(key, value);
      return true;
    }
    if (value is String) {
      await _preferences.setString(key, value);
      return true;
    }
    if (value is List<String>) {
      await _preferences.setStringList(key, value);
      return true;
    }

    return false;
  }

  dynamic getData({required String key}) {
    return _preferences.get(key);
  }

  void removeData({required String key}) {
    _preferences.remove(key);
  }

  void clearPrefs() {
    _preferences.clear();
  }

  Future<bool?> getIsAppFirstRun() async {
    // if (_preferences.get(key)) return false;
    return null;
  }
}

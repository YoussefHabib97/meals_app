// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:meals_app/constants/themes.dart';

class SharedPrefsService {
  // Singleton
  SharedPrefsService._();
  static final SharedPrefsService _instance = SharedPrefsService._();
  static SharedPrefsService get instance => _instance;

  late SharedPreferences _preferences;

  static const String _kIsAppFirstRunKey = 'appIsFirstRun';
  late bool isAppFirstRun;

  Future<void> initSharedPrefs() async {
    _preferences = await SharedPreferences.getInstance();
    await getIsAppFirstRun();
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
    if (_preferences.get(_kIsAppFirstRunKey) == null ||
        _preferences.get(_kIsAppFirstRunKey) == true) {
      isAppFirstRun = true;
      setData(key: _kIsAppFirstRunKey, value: isAppFirstRun);
      setData(key: kAppThemeKey, value: kAppThemeDeviceDefault);
      return isAppFirstRun;
    } else {
      isAppFirstRun = false;
      setData(key: _kIsAppFirstRunKey, value: isAppFirstRun);
      return isAppFirstRun;
    }
  }
}

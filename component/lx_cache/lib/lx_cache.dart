library lx_cache;

import 'package:shared_preferences/shared_preferences.dart';

/// 本地持久化
class LxCache {
  LxCache._pre(this._sharedPreferences);

  /// 预初始化，防止 get 时未初始化完成
  static preInit() async {
    _instance ??= LxCache._pre(await SharedPreferences.getInstance());
    return _instance!;
  }

  LxCache._() {
    _init();
  }

  factory LxCache() => _getInstance();

  static LxCache get instance => _getInstance();

  static LxCache? _instance;
  SharedPreferences? _sharedPreferences;

  static LxCache _getInstance() {
    _instance ??= LxCache._();
    return _instance!;
  }

  void _init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  T? get<T>(String key) {
    return _sharedPreferences?.get(key) as T?;
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return get<bool>(key) ?? defaultValue;
  }

  int getInt(String key, {int defaultValue = -1}) {
    return get<int>(key) ?? defaultValue;
  }

  double getDouble(String key, {double defaultValue = -1}) {
    return get<double>(key) ?? defaultValue;
  }

  String getString(String key, {String defaultValue = ""}) {
    return get<String>(key) ?? defaultValue;
  }

  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _sharedPreferences?.getStringList(key) ?? defaultValue;
  }

  LxCache setBool(String key, bool value) {
    _sharedPreferences?.setBool(key, value);
    return this;
  }

  LxCache setInt(String key, int value) {
    _sharedPreferences?.setInt(key, value);
    return this;
  }

  LxCache setDouble(String key, double value) {
    _sharedPreferences?.setDouble(key, value);
    return this;
  }

  LxCache setString(String key, String value) {
    _sharedPreferences?.setString(key, value);
    return this;
  }

  LxCache setStringList(String key, List<String> value) {
    _sharedPreferences?.setStringList(key, value);
    return this;
  }
}

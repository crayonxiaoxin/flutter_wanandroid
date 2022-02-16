import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_wan_android/constants.dart';
import 'package:flutter_wan_android/utils/color.dart';
import 'package:lx_cache/lx_cache.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['system', 'light', 'dark'][index];
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode? _themeMode;
  var _platformBrightness =
      SchedulerBinding.instance?.window.platformBrightness;

  /// 系统 dark mode 发生变化
  void systemDarkModeChange() {
    if (_platformBrightness !=
        SchedulerBinding.instance?.window.platformBrightness) {
      _platformBrightness =
          SchedulerBinding.instance?.window.platformBrightness;
      notifyListeners();
    }
  }

  /// 当前是否是 暗黑模式
  bool isDarkMode() {
    _themeMode ??= getThemeMode();
    if (_themeMode == ThemeMode.system) {
      // 获取系统的 dark mode
      return SchedulerBinding.instance?.window.platformBrightness ==
          Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  /// 当前是否是 跟随系统模式
  bool isFollowSystem() {
    _themeMode ??= getThemeMode();
    return _themeMode == ThemeMode.system;
  }

  /// 当前的主题模式
  ThemeMode getThemeMode() {
    String? theme = LxCache.instance.getString(Constants.themeMode);
    switch (theme) {
      case "dark":
        _themeMode = ThemeMode.dark;
        break;
      case "light":
        _themeMode = ThemeMode.light;
        break;
      case "system":
        _themeMode = ThemeMode.system;
        break;
      default:
        _themeMode = ThemeMode.light;
        break;
    }
    return _themeMode!;
  }

  /// 设置主题
  void setTheme(ThemeMode themeMode) {
    LxCache.instance.setString(Constants.themeMode, themeMode.value);
    _themeMode = themeMode;
    notifyListeners();
  }

  /// 页面切换 过渡动画
  static const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
      <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
  };

  /// 获取主题
  ThemeData getTheme({bool isDarkMode = false}) {
    var themeData = ThemeData(
        // 背景主色调
        primaryColor: isDarkMode ? LxColor.darkBg : Colors.white,
        // 指示器颜色
        indicatorColor: isDarkMode ? primary[50] : Colors.white,
        // 页面背景色
        scaffoldBackgroundColor: isDarkMode ? LxColor.darkBg : Colors.white,
        colorScheme: ColorScheme(
            primary: Colors.blue,
            primaryVariant: isDarkMode ? LxColor.darkBg : Colors.blueAccent,
            secondary: isDarkMode ? primary[50]! : Colors.white,
            secondaryVariant: isDarkMode ? primary[50]! : Colors.white,
            // surface: isDarkMode ? Colors.grey[800]! : Colors.white,
            surface: isDarkMode ? LxColor.darkBg : Colors.white,
            background: isDarkMode ? LxColor.darkBg : Colors.white,
            error: isDarkMode ? LxColor.darkRed : LxColor.red,
            onPrimary: isDarkMode ? Colors.white : LxColor.darkBg,
            onSecondary: isDarkMode ? Colors.white : LxColor.darkBg,
            onSurface: isDarkMode ? Colors.white : LxColor.darkBg,
            onBackground: isDarkMode ? Colors.white : LxColor.darkBg,
            onError: isDarkMode ? LxColor.darkBg : Colors.white,
            brightness: isDarkMode ? Brightness.dark : Brightness.light),
        pageTransitionsTheme:
            const PageTransitionsTheme(builders: _defaultBuilders));
    return themeData;
  }
}

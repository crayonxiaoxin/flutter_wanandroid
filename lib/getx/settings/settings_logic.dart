import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wan_android/getx/home/home_logic.dart';
import 'package:get/get.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_cache/lx_cache.dart';

import '../../constants.dart';
import 'settings_state.dart';

class SettingsLogic extends FullLifeCycleController {
  final SettingsState state = SettingsState();

  @override
  onInit() {
    super.onInit();
    _currentLanguage();
    state.showHomeBanner.value = _canShowBanner();
    state.showHomeTopArticles.value = _canShowTopArticles();
    state.themeMode.value = _getThemeMode();
    state.isDarkMode.value = _isDarkMode();
    state.isFollowSystem.value = _isFollowSystemTheme();

    /// 监听依赖关系变化
    WidgetsBinding.instance?.addObserver(this);

    /// 初始化
    setTheme(_getThemeMode());
    setLanguage(_currentLanguage());

    // _enableNativeEventTest();
  }

  static const EventChannel _eventChannel =
      EventChannel(Constants.eventChannel);
  StreamSubscription? _streamSubscription;

  void _enableNativeEventTest() {
    _streamSubscription =
        _eventChannel.receiveBroadcastStream(["test"]).listen((event) {
      // 监听到回调，toast
      toast(event);
    });
  }

  void _disableNativeEventTest() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
  }

  @override
  onClose() {
    WidgetsBinding.instance?.removeObserver(this);
    // _disableNativeEventTest();
    super.onClose();
  }

  /// 系统 dark mode 发生变化
  @override
  void didChangePlatformBrightness() {
    if (_isFollowSystemTheme()) {
      setTheme(_getThemeMode());
    }
  }

  /// 切换语言
  setLanguage(String localeName) {
    LxCache.instance.setString(Constants.language, localeName);
    var locale = _getLocale(localeName);
    state.currentLang.value = localeName;
    Get.updateLocale(locale);
  }

  /// 当前语言环境 locale
  Locale currentLocale() {
    var locale = _getLocale(state.currentLang.value);
    return locale;
  }

  /// 当前语言 format 名字 ，例如 简体中文、英语 等
  String currentLanguageFormat() {
    var current = _currentLanguage();
    for (var element in state.supportedLanguages.entries) {
      if (current == element.key) {
        return element.value;
      }
    }
    return "";
  }

  /// 当前语言 locale name ， 例如 zh、en 等
  String _currentLanguage() {
    state.currentLang.value =
        LxCache.instance.getString(Constants.language, defaultValue: "system");
    return state.currentLang.value;
  }

  /// 通过语言环境名称 获取语言环境
  Locale _getLocale(String localeName) {
    if (localeName == "system") {
      // 如果是web，默认系统是简体中文
      localeName = kIsWeb ? "zh" : Platform.localeName;
    }
    if (localeName == "zh_TW") localeName = "zh_HK";
    if (localeName == "zh_CN") localeName = "zh";
    for (var element in state.supportedLanguages.entries) {
      if (element.key == localeName) {
        if (localeName == "zh_HK") {
          return const Locale.fromSubtags(
              languageCode: "zh", countryCode: "HK");
        } else {
          return Locale.fromSubtags(languageCode: localeName);
        }
      }
    }
    return const Locale.fromSubtags(languageCode: "en");
  }

  void showBanner({bool show = true}) {
    LxCache.instance.setBool(Constants.showHomeBanner, show);
    state.showHomeBanner.value = show;
    var homeLogic = Get.find<HomeLogic>();
    homeLogic.onLoading(isLoadMore: false);
  }

  void showTopArticles({bool show = true}) {
    LxCache.instance.setBool(Constants.showHomeTopArticles, show);
    state.showHomeTopArticles.value = show;
    var homeLogic = Get.find<HomeLogic>();
    homeLogic.onLoading(isLoadMore: false);
  }

  /// 是否显示首页 banner
  bool _canShowBanner() {
    return LxCache.instance
        .getBool(Constants.showHomeBanner, defaultValue: true);
  }

  /// 是否显示首页置顶文章
  bool _canShowTopArticles() {
    return LxCache.instance
        .getBool(Constants.showHomeTopArticles, defaultValue: true);
  }

  /// 设置主题
  /// getX bug: 本身就处于黑夜模式下时，无法切换主题，必须添加
  ///     GetMaterialApp(
  ///       // 添加这一行：
  ///       themeMode: ThemeMode.light,
  ///     )
  /// https://github.com/jonataslaw/getx/issues/1411
  void setTheme(ThemeMode themeMode) {
    LxCache.instance.setString(Constants.themeMode, themeMode.value);
    state.themeMode.value = themeMode;
    state.isFollowSystem.value = _isFollowSystemTheme();
    state.isDarkMode.value = _isFollowSystemTheme() ? false : _isDarkMode();
    var theme = _getTheme(isDarkMode: _isDarkMode());
    Get.changeTheme(theme);
    Get.forceAppUpdate();
  }

  /// 当前是否是 暗黑模式
  bool _isDarkMode() {
    if (state.themeMode.value == ThemeMode.system) {
      return Get.isPlatformDarkMode;
    }
    return state.themeMode.value == ThemeMode.dark;
  }

  /// 当前是否是 跟随系统模式
  bool _isFollowSystemTheme() {
    return state.themeMode.value == ThemeMode.system;
  }

  /// 当前的主题模式
  ThemeMode _getThemeMode({ThemeMode? defaultMode}) {
    String? theme = LxCache.instance.getString(Constants.themeMode);
    ThemeMode themeMode;
    switch (theme) {
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      case "light":
        themeMode = ThemeMode.light;
        break;
      case "system":
        themeMode = ThemeMode.system;
        break;
      default:
        themeMode = defaultMode ?? ThemeMode.system;
        break;
    }
    return themeMode;
  }

  /// 获取主题
  ThemeData _getTheme({bool isDarkMode = false}) {
    if (isDarkMode) {
      return ThemeData.dark();
    } else {
      return ThemeData.light();
    }
  }
}

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['system', 'light', 'dark'][index];
}

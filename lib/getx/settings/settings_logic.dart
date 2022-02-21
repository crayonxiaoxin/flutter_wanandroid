import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/settings/theme.dart';
import 'package:get/get.dart';
import 'package:lx_cache/lx_cache.dart';

import '../../constants.dart';
import '../../generated/l10n.dart';
import 'settings_state.dart';

class SettingsLogic extends GetxController {
  final SettingsState state = SettingsState();
  final ThemeLogic themeLogic = ThemeLogic();

  @override
  onInit() {
    super.onInit();
    currentLanguage();
    state.showHomeBanner.value = canShowBanner();
    state.showHomeTopArticles.value = canShowTopArticles();
    state.themeMode.value = getThemeMode(defaultMode: ThemeMode.system);
    state.isDarkMode.value = isDarkMode();
    state.isFollowSystem.value = isFollowSystem();
  }

  /// 当前语言环境
  Locale currentLocale() {
    var locale = getLocale(state.currentLang.value);
    return locale;
  }

  /// 当前语言 locale
  String currentLanguage() {
    state.currentLang.value =
        LxCache.instance.getString(Constants.language, defaultValue: "system");
    return state.currentLang.value;
  }

  /// 当前语言 名字
  String currentLanguageString() {
    var current = currentLanguage();
    for (var element in state.supportedLanguages.entries) {
      if (current == element.key) {
        return element.value;
      }
    }
    return "";
  }

  /// 切换语言
  setLanguage(String localeName) {
    LxCache.instance.setString(Constants.language, localeName);
    S.load(getLocale(localeName));
    state.currentLang.value = localeName;
  }

  /// 通过语言环境名称 获取语言环境
  Locale getLocale(String localeName) {
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

  /// 是否显示首页 banner
  bool canShowBanner() {
    return LxCache.instance
        .getBool(Constants.showHomeBanner, defaultValue: true);
  }

  void showBanner({bool show = true}) {
    LxCache.instance.setBool(Constants.showHomeBanner, show);
    state.showHomeBanner.value = show;
  }

  /// 是否显示首页置顶文章
  bool canShowTopArticles() {
    return LxCache.instance
        .getBool(Constants.showHomeTopArticles, defaultValue: true);
  }

  void showTopArticles({bool show = true}) {
    LxCache.instance.setBool(Constants.showHomeTopArticles, show);
    state.showHomeTopArticles.value = show;
  }

  /// 系统 dark mode 发生变化
  Brightness? systemDarkModeChange() {
    return themeLogic.systemDarkModeChange();
  }

  /// 当前是否是 暗黑模式
  bool isDarkMode() {
    return themeLogic.isDarkMode();
  }

  /// 当前是否是 跟随系统模式
  bool isFollowSystem() {
    return state.themeMode.value == ThemeMode.system;
  }

  /// 当前的主题模式
  ThemeMode getThemeMode({ThemeMode? defaultMode}) {
    return themeLogic.getThemeMode(defaultMode: defaultMode);
  }

  /// 设置主题
  void setTheme(ThemeMode themeMode) {
    themeLogic.setTheme(themeMode);
    state.themeMode.value = themeMode;
    state.isDarkMode.value = isFollowSystem() ? false : isDarkMode();
    Get.changeTheme(getTheme(isDarkMode: isDarkMode()));
  }

  /// 获取主题
  ThemeData getTheme({bool isDarkMode = false}) {
    return themeLogic.getTheme(isDarkMode: isDarkMode);
  }
}

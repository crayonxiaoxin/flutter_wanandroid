import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsState {
  late RxString currentLang;
  late RxBool showHomeBanner;
  late RxBool showHomeTopArticles;
  late Rx<ThemeMode> themeMode;
  late RxBool isDarkMode;
  late RxBool isFollowSystem;

  SettingsState() {
    currentLang = "".obs;
    showHomeBanner = true.obs;
    showHomeTopArticles = true.obs;
    themeMode = ThemeMode.system.obs;
    isDarkMode = false.obs;
    isFollowSystem = false.obs;
  }

  var supportedLanguages = {
    "system": "system",
    "zh": "简体中文",
    "zh_HK": "繁体中文",
    "en": "English"
  };
}

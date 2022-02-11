import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_wan_android/constants.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:lx_cache/lx_cache.dart';

var supportedLanguages = {
  "system": "system",
  "zh": "简体中文",
  "zh_HK": "繁体中文",
  "en": "English"
};

class LanguageProvider extends ChangeNotifier {
  var _current;

  void systemLanguageChange() {
    var localeName = "system";
    print("system language changed => ${currentLanguage()}");
    if (currentLanguage() == localeName) {
      S.load(getLocale(localeName));
      notifyListeners();
    }
  }

  /// 当前语言环境
  Locale currentLocale() {
    _current ??= currentLanguage();
    var locale = getLocale(_current);
    print("locale 666=>$_current , $locale , ${currentLanguage()}");
    return locale;
  }

  /// 当前语言 locale
  String currentLanguage() {
    _current ??=
        LxCache.instance.getString(Constants.language, defaultValue: "system");
    print("locale 667=> $_current");
    return _current;
  }

  /// 当前语言 名字
  String currentLanguageString() {
    var current = currentLanguage();
    for (var element in supportedLanguages.entries) {
      if (current == element.key) {
        return element.value;
      }
    }
    return "";
  }

  /// 切换语言
  setLanguage(String localeName) {
    _current = localeName;
    LxCache.instance.setString(Constants.language, localeName);
    S.load(getLocale(localeName));
    notifyListeners();
  }

  /// 通过语言环境名称 获取语言环境
  Locale getLocale(String localeName) {
    if (localeName == "system") localeName = Platform.localeName;
    if (localeName == "zh_TW") localeName = "zh_HK";
    if (localeName == "zh_CN") localeName = "zh";
    for (var element in supportedLanguages.entries) {
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
}

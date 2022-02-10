import 'package:flutter/cupertino.dart';
import 'package:flutter_wan_android/generated/l10n.dart';

enum Language { system, simplifiedChinese, traditionalChinese, english }

extension LanguageExtension on Language {
  get value => <String>[
        S.current.settings_follow_system,
        "简体中文",
        "繁体中文",
        "English"
      ][index];
}

class LanguageProvider extends ChangeNotifier {}

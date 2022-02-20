import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/provider/home_provider.dart';
import 'package:flutter_wan_android/provider/language_provider.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:flutter_wan_android/utils/color.dart';
import 'package:flutter_wan_android/widgets/SwitchItem.dart';
import 'package:flutter_wan_android/widgets/setting_item.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';
import 'package:provider/src/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends LxState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var themeProvider = context.watch<ThemeProvider>();
    var homeProvider = context.watch<HomeProvider>();
    var langProvider = context.watch<LanguageProvider>();
    var _currentLanguage = langProvider.currentLanguageString();
    if (_currentLanguage == "system") {
      _currentLanguage = S.of(context).settings_follow_system;
    }
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          SwitchItem(
            label: S.of(context).settings_follow_system,
            value: themeProvider.isFollowSystem(),
            desc: S.of(context).settings_follow_system_desc,
            onChanged: (value) {
              if (value) {
                themeProvider.setTheme(ThemeMode.system);
              } else {
                themeProvider.setTheme(ThemeMode.light);
              }
            },
          ),
          SwitchItem(
            label: S.of(context).settings_dark_mode,
            value: themeProvider.isDarkMode(),
            disabled: themeProvider.isFollowSystem(),
            onChanged: (value) {
              if (value) {
                themeProvider.setTheme(ThemeMode.dark);
              } else {
                themeProvider.setTheme(ThemeMode.light);
              }
            },
          ),
          SwitchItem(
            label: S.of(context).settings_home_banner,
            value: homeProvider.canShowBanner(),
            desc: S.of(context).settings_home_banner_desc,
            onChanged: (value) {
              homeProvider.showBanner(show: value);
            },
          ),
          SwitchItem(
            label: S.of(context).settings_home_top_articles,
            desc: S.of(context).settings_home_top_articles_desc,
            value: homeProvider.canShowTopArticles(),
            onChanged: (value) {
              homeProvider.showTopArticles(show: value);
            },
          ),
          SettingItem(
              label: S.of(context).switch_language,
              desc: _currentLanguage,
              fontWeight: FontWeight.bold,
              onTap: _switchLanguage),
        ],
      ),
    );
  }

  _appBar() {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2,
      leading: const BackButton(color: Colors.white),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            Center(
              child: Text(
                S.of(context).settings,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _switchLanguage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          var langProvider = context.watch<LanguageProvider>();
          return SizedBox(
            height: 300,
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    S.of(context).switch_language,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(Icons.translate, color: primary),
                ),
                ..._languageItems(langProvider)
              ],
            ),
          );
        });
  }

  ListTile _languageItem(String language,
      {bool isSelected = false, VoidCallback? onTap}) {
    return ListTile(
        title: Text(language, style: const TextStyle(fontSize: 14)),
        trailing: isSelected ? const Icon(Icons.done, color: primary) : null,
        onTap: onTap);
  }

  _languageItems(LanguageProvider langProvider) {
    var list = [];
    for (var element in supportedLanguages.entries) {
      var value = element.key == "system"
          ? S.of(context).settings_follow_system
          : element.value;
      list.add(_languageItem(value,
          isSelected: element.key == langProvider.currentLanguage(), onTap: () {
        langProvider.setLanguage(element.key);
        Navigator.of(context).pop();
      }));
    }
    return list;
  }
}

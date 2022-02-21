import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../generated/l10n.dart';
import '../../utils/color.dart';
import '../../widgets/SwitchItem.dart';
import '../../widgets/setting_item.dart';
import 'settings_logic.dart';

class SettingsPage extends StatelessWidget {
  final logic = Get.put(SettingsLogic());
  final state = Get.find<SettingsLogic>().state;

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _currentLanguage = logic.currentLanguageString();
    if (_currentLanguage == "system") {
      _currentLanguage = S.of(context).settings_follow_system;
    }
    return Obx(() {
      return Scaffold(
        appBar: _appBar(context),
        body: ListView(
          children: [
            SwitchItem(
              label: S.of(context).settings_follow_system,
              value: state.isFollowSystem.value,
              desc: S.of(context).settings_follow_system_desc,
              onChanged: (value) {
                state.isFollowSystem.value = value;
                if (value) {
                  logic.setTheme(ThemeMode.system);
                } else {
                  logic.setTheme(ThemeMode.light);
                }
              },
            ),
            SwitchItem(
              label: S.of(context).settings_dark_mode,
              value: state.isDarkMode.value,
              disabled: state.isFollowSystem.value,
              onChanged: (value) {
                state.isDarkMode.value = value;
                if (value) {
                  logic.setTheme(ThemeMode.dark);
                } else {
                  logic.setTheme(ThemeMode.light);
                }
              },
            ),
            SwitchItem(
              label: S.of(context).settings_home_banner,
              value: state.showHomeBanner.value,
              desc: S.of(context).settings_home_banner_desc,
              onChanged: (value) {
                logic.showBanner(show: value);
              },
            ),
            SwitchItem(
              label: S.of(context).settings_home_top_articles,
              desc: S.of(context).settings_home_top_articles_desc,
              value: state.showHomeTopArticles.value,
              onChanged: (value) {
                logic.showTopArticles(show: value);
              },
            ),
            SettingItem(
                label: S.of(context).switch_language,
                desc: _currentLanguage,
                fontWeight: FontWeight.bold,
                onTap: () => _switchLanguage(context)),
          ],
        ),
      );
    });
  }

  _appBar(BuildContext context) {
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

  void _switchLanguage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
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
                ..._languageItems(context)
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

  _languageItems(BuildContext context) {
    var list = [];
    for (var element in state.supportedLanguages.entries) {
      var value = element.key == "system"
          ? S.of(context).settings_follow_system
          : element.value;
      list.add(_languageItem(value,
          isSelected: element.key == state.currentLang.value, onTap: () {
        logic.setLanguage(element.key);
        Navigator.of(context).pop();
      }));
    }
    return list;
  }
}

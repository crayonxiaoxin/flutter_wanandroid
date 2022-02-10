import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/provider/home_provider.dart';
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
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          SwitchItem(
            label: S.current.settings_follow_system,
            value: themeProvider.isFollowSystem(),
            desc: S.current.settings_follow_system_desc,
            onChanged: (value) {
              if (value) {
                themeProvider.setTheme(ThemeMode.system);
              } else {
                themeProvider.setTheme(ThemeMode.light);
              }
            },
          ),
          SwitchItem(
            label: S.current.settings_dark_mode,
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
            label: S.current.settings_home_banner,
            value: homeProvider.canShowBanner(),
            desc: S.current.settings_home_banner_desc,
            onChanged: (value) {
              homeProvider.showBanner(show: value);
            },
          ),
          SwitchItem(
            label: S.current.settings_home_top_articles,
            desc: S.current.settings_home_top_articles_desc,
            value: homeProvider.canShowTopArticles(),
            onChanged: (value) {
              homeProvider.showTopArticles(show: value);
            },
          ),
          SettingItem(
              label: "切换语言",
              desc: "跟随系统",
              fontWeight: FontWeight.bold,
              onTap: _switchLanguage),
        ],
      ),
    );
  }

  _appBar() {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.blueAccent],
      ),
      elevation: 2,
      leading: const BackButton(color: Colors.white),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            Center(
              child: Text(
                S.current.settings,
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
          return Container(
            height: 300,
            child: ListView(
              children: [
                const ListTile(
                  title: Text(
                    "切换语言",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.translate,
                    color: primary,
                  ),
                ),
                _languageItem("跟随系统", isSelected: true, onTap: () {}),
                _languageItem("简体中文", onTap: () {}),
                _languageItem("繁體中文", onTap: () {}),
                _languageItem("English", onTap: () {}),
              ],
            ),
          );
        });
  }

  ListTile _languageItem(String language,
      {bool isSelected = false, VoidCallback? onTap}) {
    return ListTile(
        title: Text(language, style: const TextStyle(fontSize: 14)),
        trailing: isSelected
            ? const Icon(
                Icons.done,
                color: primary,
              )
            : null,
        onTap: onTap);
  }
}

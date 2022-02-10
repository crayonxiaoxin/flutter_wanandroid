import 'package:flutter/material.dart';
import 'package:flutter_wan_android/provider/home_provider.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:flutter_wan_android/widgets/SwitchItem.dart';
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
            label: "跟随系统",
            value: themeProvider.isFollowSystem(),
            desc: "黑夜模式跟随系统",
            onChanged: (value) {
              if (value) {
                themeProvider.setTheme(ThemeMode.system);
              } else {
                themeProvider.setTheme(ThemeMode.light);
              }
            },
          ),
          SwitchItem(
            label: "黑夜模式",
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
            label: "轮播图",
            value: homeProvider.canShowBanner(),
            desc: "是否展示首页轮播图",
            onChanged: (value) {
              homeProvider.showBanner(show: value);
            },
          ),
          SwitchItem(
            label: "置顶文章",
            desc: "是否展示首页置顶文章",
            value: homeProvider.canShowTopArticles(),
            onChanged: (value) {
              homeProvider.showTopArticles(show: value);
            },
          ),
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
          children: const [
            Center(
              child: Text(
                "设置",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

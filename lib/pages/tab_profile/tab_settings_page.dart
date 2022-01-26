import 'package:flutter/material.dart';
import 'package:flutter_wan_android/widgets/SwitchItem.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends LxState<SettingsPage> {
  bool _followSystem = true;
  bool _isDarkMode = false;
  bool _showHomeBanner = true;
  bool _showHomeTopArticles = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          SwitchItem(
            label: "跟随系统",
            value: _followSystem,
            desc: "黑夜模式跟随系统",
            onChanged: (value) {
              setState(() {
                _followSystem = value;
                if (value) {
                  _isDarkMode = false;
                }
              });
            },
          ),
          SwitchItem(
            label: "黑夜模式",
            value: _isDarkMode,
            disabled: _followSystem,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),
          SwitchItem(
            label: "轮播图",
            value: _showHomeBanner,
            desc: "是否展示首页轮播图",
            onChanged: (value) {
              setState(() {
                _showHomeBanner = value;
              });
            },
          ),
          SwitchItem(
            label: "置顶文章",
            desc: "是否展示首页置顶文章",
            value: _showHomeTopArticles,
            onChanged: (value) {
              setState(() {
                _showHomeTopArticles = value;
              });
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
      leading: const BackButton(),
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

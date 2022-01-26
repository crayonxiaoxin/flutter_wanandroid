import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/login_entity.dart';
import 'package:flutter_wan_android/model/user_info_entity.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/widgets/setting_item.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends LxState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // LoginDao.logout();
    if (LoginDao.isLogin) {
      _loadUserInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var userInfo = LoginDao.userInfo();
    var coinInfo = LoginDao.coinInfo();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ImmersiveAppBar(
        gradient: const LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blueAccent],
        ),
        elevation: 2,
        height: 160,
        builder: (context) {
          return _buildAppBarContent(userInfo, coinInfo, context);
        },
      ),
      body: _buildContent(userInfo),
    );
  }

  Center _buildAppBarContent(LoginData? userInfo,
      UserInfoDataCoinInfo? coinInfo, BuildContext context) {
    return Center(
      child: LoginDao.isLogin
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${userInfo?.nickname}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  "Lv.${coinInfo?.level},  排名: ${coinInfo?.rank ?? 0}",
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            )
          : InkWell(
              onTap: () {
                MyRouterDelegate.of(context).push(MyRoutePath.login(),
                    onPopResult: (result) {
                  if (result == true) {
                    setState(() {});
                    _loadUserInfo();
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "未登录",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
    );
  }

  _buildContent(LoginData? userInfo) {
    return ListView(
      children: [
        SettingItem(
            label: "我的积分",
            desc: "${userInfo?.coinCount}",
            icon: Icons.school_outlined,
            onTap: () {
              MyRouterDelegate.of(context).push(MyRoutePath.coinList());
            }),
        SettingItem(
            label: "我的分享",
            icon: Icons.share,
            onTap: () {
              toast("敬请期待！");
            }),
        SettingItem(
            label: "我的收藏",
            icon: Icons.favorite_border_outlined,
            onTap: () {
              MyRouterDelegate.of(context).push(LoginDao.isLogin
                  ? MyRoutePath.collectList()
                  : MyRoutePath.login());
            }),
        SettingItem(
            label: "系统设置",
            icon: Icons.settings,
            onTap: () {
              MyRouterDelegate.of(context).push(MyRoutePath.settings());
            }),
        if (LoginDao.isLogin)
          SettingItem(label: "退出登录", icon: Icons.logout, onTap: _logout)
      ],
    );
  }

  _loadUserInfo() async {
    var res = await LoginDao.getUserInfo();
    if (res.errorCode == 0) {
      setState(() {});
    }
  }

  void _logout() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('您确定要退出登录吗？'),
          actions: <Widget>[
            TextButton(
              child: Text('确定'),
              onPressed: () {
                LoginDao.logout();
                Navigator.of(dialogContext).pop();
                setState(() {});
              },
            ),
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}

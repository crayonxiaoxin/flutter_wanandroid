import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/model/login_entity.dart';
import 'package:flutter_wan_android/model/user_info_entity.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/native_method.dart';
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
                  S.of(context).profile_level(
                      coinInfo?.level ?? "", coinInfo?.rank ?? "0"),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).profile_not_login,
                  style: const TextStyle(
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
            label: S.of(context).profile_coin,
            desc: "${userInfo?.coinCount}",
            icon: Icons.school_outlined,
            onTap: () {
              MyRouterDelegate.of(context).push(LoginDao.isLogin
                  ? MyRoutePath.coinList()
                  : MyRoutePath.login());
            }),
        SettingItem(
            label: S.of(context).profile_share,
            icon: Icons.share,
            onTap: () {
              toast(S.of(context).coming_soon);
            }),
        SettingItem(
            label: S.of(context).profile_favorite,
            icon: Icons.favorite_border_outlined,
            onTap: () {
              MyRouterDelegate.of(context).push(LoginDao.isLogin
                  ? MyRoutePath.collectList()
                  : MyRoutePath.login());
            }),
        SettingItem(
            label: S.of(context).profile_settings,
            icon: Icons.settings,
            onTap: () {
              MyRouterDelegate.of(context).push(MyRoutePath.settings());
            }),
        SettingItem(
            label: S.of(context).test_native_calls,
            icon: Icons.code,
            onTap: _callNative),
        if (LoginDao.isLogin)
          SettingItem(
              label: S.of(context).profile_logout,
              icon: Icons.logout,
              onTap: _logout)
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
          title: Text(S.of(context).dialog_prompt),
          content: Text(S.of(context).dialog_prompt_logout),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).dialog_yes),
              onPressed: () {
                LoginDao.logout();
                Navigator.of(dialogContext).pop();
                setState(() {});
              },
            ),
            TextButton(
              child: Text(S.of(context).dialog_no),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  /// Flutter 调用 Android 原生方法
  void _callNative() {
    if (!kIsWeb && Platform.isAndroid) {
      nativeAlert("${S.of(context).test_native_calls} AlertDialog");
      nativeToast("${S.of(context).test_native_calls} Toast");
    } else {
      toast("Not Implemented!");
    }
  }
}

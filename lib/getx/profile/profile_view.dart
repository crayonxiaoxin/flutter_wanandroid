import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../generated/l10n.dart';
import '../../model/login_entity.dart';
import '../../model/user_info_entity.dart';
import '../../net/dao/login_dao.dart';
import '../../widgets/setting_item.dart';
import 'profile_logic.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(ProfileLogic());
  final state = Get.find<ProfileLogic>().state;

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    state.isLogin.value = LoginDao.isLogin;
    var userInfo = LoginDao.userInfo();
    var coinInfo = LoginDao.coinInfo();
    if (LoginDao.isLogin) {
      logic.loadUserInfo();
    }
    return Obx(() {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ImmersiveAppBar(
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
          ),
          elevation: 2,
          height: 160,
          builder: (context) {
            return _buildAppBarContent(userInfo, coinInfo, context);
          },
        ),
        body: _buildContent(userInfo),
      );
    });
  }

  _buildAppBarContent(LoginData? userInfo, UserInfoDataCoinInfo? coinInfo,
      BuildContext context) {
    return Center(
      child: state.isLogin.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${userInfo?.nickname}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.grey.shade700,
                            blurRadius: 3,
                            offset: const Offset(2, 2))
                      ]),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 8)),
                Text(
                  S.of(context).profile_level(
                      coinInfo?.level ?? "", coinInfo?.rank ?? "0"),
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            )
          : InkWell(
              onTap: () => logic.toLogin(),
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
    var context = Get.context!;
    return ListView(
      children: [
        SettingItem(
            label: S.of(context).profile_coin,
            desc: "${userInfo?.coinCount}",
            icon: Icons.school_outlined,
            onTap: () {
              if (state.isLogin.value) {
                Get.toNamed(Routes.Coin);
              } else {
                logic.toLogin();
              }
            }),
        SettingItem(
            label: S.of(context).profile_share,
            icon: Icons.share,
            onTap: () {
              if (state.isLogin.value) {
                Get.toNamed(Routes.ShareList);
              } else {
                logic.toLogin();
              }
            }),
        SettingItem(
            label: S.of(context).profile_favorite,
            icon: Icons.favorite_border_outlined,
            onTap: () {
              if (state.isLogin.value) {
                Get.toNamed(Routes.CollectList);
              } else {
                logic.toLogin();
              }
            }),
        SettingItem(
            label: S.of(context).profile_settings,
            icon: Icons.settings,
            onTap: () {
              Get.toNamed(Routes.Settings);
            }),
        // SettingItem(
        //     label: S.of(context).test_native_calls,
        //     icon: Icons.code,
        //     onTap: _callNative),
        if (state.isLogin.value)
          SettingItem(
              label: S.of(context).profile_logout,
              icon: Icons.logout,
              onTap: () => logic.logout())
      ],
    );
  }
}

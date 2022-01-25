import 'package:flutter/material.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/lx_state.dart';
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
                        "等级：${coinInfo?.level}, 积分：${userInfo?.coinCount ?? 0}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
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
        },
      ),
      body: _buildContent(),
    );
  }

  _buildContent() {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text("123"),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text("123"),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text("123"),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text("123"),
        )
      ],
    );
  }

  _loadUserInfo() async {
    // var res = await LoginDao.getUserInfo();
    // if (res.errorCode == 0) {
    //   setState(() {});
    // }
    await LoginDao.getCoinCount();
  }
}

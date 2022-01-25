import 'package:flutter/material.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends LxState<LoginPage> {
  String _username = "";
  String _password = "";
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: ImmersiveAppBar(
        leading: const BackButton(),
        gradient: const LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blueAccent],
        ),
        elevation: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            children: [
              const Center(
                child: Text(
                  "登录",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text("注册",
                          style: TextStyle(color: Colors.grey[200]!)),
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: _buildContent(),
    );
  }

  Center _buildContent() {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            const Spacer(),
            const Icon(
              Icons.android_outlined,
              color: Colors.blue,
              size: 100,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    _username = value.trim();
                  });
                },
                onSubmitted: (value) {
                  _focusNode.requestFocus();
                },
                decoration: InputDecoration(
                    labelText: "用户名",
                    border: OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 16)),
            SizedBox(
              height: 50,
              child: TextField(
                focusNode: _focusNode,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
                onSubmitted: (value) {
                  _login();
                },
                decoration: InputDecoration(
                    labelText: "密码",
                    border: OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue,
              elevation: 2.0,
              child: InkWell(
                onTap: _login,
                child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      "登录",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 50)),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _login() async {
    if (_username.isEmpty || _password.isEmpty) {
      toast("用户名或密码不能为空");
    } else {
      var res = await LoginDao.login(_username, _password);
      if (res.errorCode != 0) {
        toast("登录失败：${res.errorMsg}");
      } else if (LoginDao.isLogin) {
        MyRouterDelegate.of(context).pop(result: LoginDao.isLogin);
      }
    }
  }
}

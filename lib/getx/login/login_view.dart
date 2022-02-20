import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/login/login_state.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../routes.dart';
import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LoginLogic());
    // final state = Get.find<LoginLogic>().state;
    final state = logic.state;

    return Scaffold(
      appBar: ImmersiveAppBar(
        leading: const BackButton(color: Colors.white),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
        ),
        elevation: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            children: [
              Center(
                child: Text(
                  S.of(context).login,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.Register);
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(S.of(context).register,
                          style: TextStyle(color: Colors.grey[200]!)),
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: _buildContent(logic, state, context),
    );
  }

  Center _buildContent(
      LoginLogic logic, LoginState state, BuildContext context) {
    final _focusNode = FocusNode();
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
                  state.username.value = value;
                },
                onSubmitted: (value) {
                  _focusNode.requestFocus();
                },
                decoration: InputDecoration(
                    labelText: S.of(context).username,
                    border: OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Obx(() {
              return SizedBox(
                height: 50,
                child: TextField(
                  focusNode: _focusNode,
                  obscureText: state.isObscure.value,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    state.password.value = value;
                  },
                  onSubmitted: (value) {
                    logic.login();
                  },
                  decoration: InputDecoration(
                      labelText: S.of(context).password,
                      suffixIcon: InkWell(
                        onTap: () {
                          logic.togglePassword();
                        },
                        child: Icon(state.isObscure.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(16))),
                ),
              );
            }),
            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue,
              elevation: 2.0,
              child: InkWell(
                onTap: () {
                  logic.login();
                },
                child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).login,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
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
}

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/register/register_state.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import 'register_logic.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(RegisterLogic());
    final state = Get.find<RegisterLogic>().state;

    return Scaffold(
      appBar: ImmersiveAppBar(
        leading: const BackButton(color: Colors.white),
        gradient: const LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blueAccent],
        ),
        elevation: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            children: [
              Center(
                child: Text(
                  S.of(context).register,
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
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(S.of(context).login,
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

  _buildContent(
      RegisterLogic logic, RegisterState state, BuildContext context) {
    final FocusNode _focusNode = FocusNode();
    final FocusNode _focusNodeRePass = FocusNode();
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
            SizedBox(
              height: 50,
              child: TextField(
                focusNode: _focusNode,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  state.password.value = value;
                },
                onSubmitted: (value) {
                  _focusNodeRePass.requestFocus();
                },
                decoration: InputDecoration(
                    labelText: S.of(context).password,
                    border: OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 16)),
            SizedBox(
              height: 50,
              child: TextField(
                focusNode: _focusNodeRePass,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  state.rePassword.value = value;
                },
                onSubmitted: (value) {
                  logic.register();
                },
                decoration: InputDecoration(
                    labelText: S.of(context).password_confirm,
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
                onTap: () {
                  logic.register();
                },
                child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).register,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../net/dao/login_dao.dart';
import '../routes.dart';
import 'profile_state.dart';

class ProfileLogic extends GetxController {
  final ProfileState state = ProfileState();

  loadUserInfo() async {
    var res = await LoginDao.getUserInfo();
    if (res.errorCode == 0) {
      state.isLogin.value = true;
    }
  }

  toLogin() async {
    var res = await Get.toNamed(Routes.Login);
    if (res == true) {
      loadUserInfo();
    }
  }

  logout() {
    var context = Get.context!;
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
                // Navigator.of(dialogContext).pop();
                Get.back();
                state.isLogin.value = false;
              },
            ),
            TextButton(
              child: Text(S.of(context).dialog_no),
              onPressed: () {
                Get.back();
                // Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}

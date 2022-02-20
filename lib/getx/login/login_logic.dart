import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:get/get.dart';
import 'package:lx_base/utils/toast.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  togglePassword() {
    state.isObscure.value = !state.isObscure.value;
  }

  login() async {
    var context = Get.context!;
    if (state.username.isEmpty || state.password.isEmpty) {
      toast(S.of(context).username_password_empty);
    } else {
      var res =
          await LoginDao.login(state.username.value, state.password.value);
      if (res.errorCode != 0) {
        toast(S.of(context).login_failed(res.errorMsg ?? ""));
      } else if (LoginDao.isLogin) {
        toast(S.of(context).login_success);
        // MyRouterDelegate.of(context).pop(result: LoginDao.isLogin);
        Get.back(result: LoginDao.isLogin);
      }
    }
  }
}

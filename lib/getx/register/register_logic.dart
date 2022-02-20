import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:get/get.dart';
import 'package:lx_base/utils/toast.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  register() async {
    var context = Get.context!;
    if (state.username.isEmpty || state.password.isEmpty) {
      toast(S.of(context).username_password_empty);
    } else if (state.password.value != state.rePassword.value) {
      toast(S.of(context).password_confirm_failed);
    } else {
      var res =
          await LoginDao.register(state.username.value, state.password.value);
      if (res) {
        toast(S.of(context).register_failed(""));
      } else {
        toast(S.of(context).register_success);
        Get.back();
      }
    }
  }
}

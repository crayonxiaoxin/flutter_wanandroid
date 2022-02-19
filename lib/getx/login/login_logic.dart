import 'package:get/get.dart';
import 'package:lx_base/utils/toast.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  togglePassword() {
    state.isObscure.value = !state.isObscure.value;
  }

  login() {
    toast("login: ${state.username} ${state.password}");
  }
}

import 'package:get/get.dart';
import 'package:lx_base/utils/toast.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  register() {
    toast("register: ${state.username} ${state.password}");
  }
}

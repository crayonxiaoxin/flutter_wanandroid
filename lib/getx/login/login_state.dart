import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LoginState {
  late RxString username;
  late RxString password;
  late RxBool isObscure;

  LoginState() {
    username = "".obs;
    password = "".obs;
    isObscure = true.obs;
  }
}

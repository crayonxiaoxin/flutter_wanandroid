import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RegisterState {
  late RxString username;
  late RxString password;
  late RxString rePassword;

  RegisterState() {
    username = "".obs;
    password = "".obs;
    rePassword = "".obs;
  }
}

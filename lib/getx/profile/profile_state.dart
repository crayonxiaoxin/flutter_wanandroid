import 'package:get/get.dart';

class ProfileState {
  late RxBool isLogin;

  ProfileState() {
    isLogin = false.obs;
  }
}

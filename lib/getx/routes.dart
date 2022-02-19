import 'package:flutter_wan_android/getx/login/login_view.dart';
import 'package:flutter_wan_android/getx/register/register_view.dart';
import 'package:get/get.dart';

class Routes {
  static const String Home = "/";
  static const String Login = "/login";
  static const String Register = "/register";
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.Home, page: () => LoginPage()),
    GetPage(name: Routes.Register, page: () => RegisterPage()),
  ];
}

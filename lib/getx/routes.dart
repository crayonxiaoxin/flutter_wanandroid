import 'package:flutter_wan_android/getx/login/login_view.dart';
import 'package:flutter_wan_android/getx/register/register_view.dart';
import 'package:get/get.dart';

import 'main/main_view.dart';

class Routes {
  static const String Home = "/";
  static const String Login = "/login";
  static const String Register = "/register";
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.Home, page: () => const MainPage()),
    GetPage(name: Routes.Login, page: () => const LoginPage()),
    GetPage(name: Routes.Register, page: () => const RegisterPage()),
  ];
}

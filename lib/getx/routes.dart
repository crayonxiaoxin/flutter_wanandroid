import 'package:flutter_wan_android/getx/abs_list/lx_page.dart';
import 'package:flutter_wan_android/getx/detail/detail_view.dart';
import 'package:flutter_wan_android/getx/hot_key/hot_key_view.dart';
import 'package:flutter_wan_android/getx/login/login_view.dart';
import 'package:flutter_wan_android/getx/query/query_view.dart';
import 'package:flutter_wan_android/getx/register/register_view.dart';
import 'package:get/get.dart';

import 'main/main_view.dart';

class Routes {
  static const String Home = "/";
  static const String Login = "/login";
  static const String Register = "/register";
  static const String Details = "/details";
  static const String HotKey = "/hotkey";
  static const String Query = "/query";
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.Home, page: () => const LxPage(MainPage())),
    GetPage(name: Routes.Login, page: () => const LxPage(LoginPage())),
    GetPage(name: Routes.Register, page: () => const LxPage(RegisterPage())),
    GetPage(name: Routes.Details, page: () => const LxPage(DetailPage())),
    GetPage(name: Routes.HotKey, page: () => LxPage(HotKeyPage())),
    GetPage(name: Routes.Query, page: () => LxPage(QueryPage())),
  ];
}

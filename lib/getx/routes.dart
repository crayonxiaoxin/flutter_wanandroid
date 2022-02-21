import 'package:flutter_wan_android/getx/abs_list/lx_page.dart';
import 'package:flutter_wan_android/getx/coin/coin_view.dart';
import 'package:flutter_wan_android/getx/detail/detail_view.dart';
import 'package:flutter_wan_android/getx/hot_key/hot_key_view.dart';
import 'package:flutter_wan_android/getx/login/login_view.dart';
import 'package:flutter_wan_android/getx/project_list/project_list_view.dart';
import 'package:flutter_wan_android/getx/query/query_view.dart';
import 'package:flutter_wan_android/getx/ranking/ranking_view.dart';
import 'package:flutter_wan_android/getx/register/register_view.dart';
import 'package:flutter_wan_android/getx/settings/settings_view.dart';
import 'package:flutter_wan_android/getx/share_list/share_list_view.dart';
import 'package:flutter_wan_android/getx/tixi_tabs/tixi_tabs_view.dart';
import 'package:flutter_wan_android/getx/wx_articles/wx_articles_view.dart';
import 'package:get/get.dart';

import 'collect_list/collect_list_view.dart';
import 'main/main_view.dart';

class Routes {
  static const String Home = "/";
  static const String Login = "/login";
  static const String Register = "/register";
  static const String Details = "/details";
  static const String HotKey = "/hotkey";
  static const String Query = "/query";
  static const String TixiTabs = "/tixi_tabs";
  static const String WxArticles = "/wx_articles";
  static const String ProjectList = "/project_list";
  static const String Coin = "/coin";
  static const String Ranking = "/ranking";
  static const String ShareList = "/share_list";
  static const String CollectList = "/collect_list";
  static const String Settings = "/settings";
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.Home, page: () => const LxPage(MainPage())),
    GetPage(name: Routes.Login, page: () => const LxPage(LoginPage())),
    GetPage(name: Routes.Register, page: () => const LxPage(RegisterPage())),
    GetPage(name: Routes.Details, page: () => const LxPage(DetailPage())),
    GetPage(name: Routes.HotKey, page: () => LxPage(HotKeyPage())),
    GetPage(name: Routes.Query, page: () => LxPage(QueryPage())),
    GetPage(name: Routes.TixiTabs, page: () => LxPage(TixiTabsPage())),
    GetPage(name: Routes.WxArticles, page: () => LxPage(WxArticlesPage())),
    GetPage(name: Routes.ProjectList, page: () => LxPage(ProjectListPage())),
    GetPage(name: Routes.Coin, page: () => LxPage(CoinPage())),
    GetPage(name: Routes.Ranking, page: () => LxPage(RankingPage())),
    GetPage(name: Routes.ShareList, page: () => LxPage(ShareListPage())),
    GetPage(name: Routes.CollectList, page: () => LxPage(CollectListPage())),
    GetPage(name: Routes.Settings, page: () => LxPage(SettingsPage())),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/constants.dart';
import 'package:lx_cache/lx_cache.dart';

class HomeProvider extends ChangeNotifier {
  bool shouldReload = false;

  /// 是否显示首页 banner
  bool canShowBanner() {
    return LxCache.instance
        .getBool(Constants.showHomeBanner, defaultValue: true);
  }

  void showBanner({bool show = true}) {
    LxCache.instance.setBool(Constants.showHomeBanner, show);
    shouldReload = true;
    notifyListeners();
  }

  void hideBanner() {
    showBanner(show: false);
  }

  /// 是否显示首页置顶文章
  bool canShowTopArticles() {
    return LxCache.instance
        .getBool(Constants.showHomeTopArticles, defaultValue: true);
  }

  void showTopArticles({bool show = true}) {
    LxCache.instance.setBool(Constants.showHomeTopArticles, show);
    shouldReload = true;
    notifyListeners();
  }

  void hideTopArticles() {
    showTopArticles(show: false);
  }
}

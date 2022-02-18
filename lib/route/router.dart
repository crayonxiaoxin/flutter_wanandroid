import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/pages/detail_page.dart';
import 'package:flutter_wan_android/pages/home_page.dart';
import 'package:flutter_wan_android/pages/hotkey_page.dart';
import 'package:flutter_wan_android/pages/login_page.dart';
import 'package:flutter_wan_android/pages/project_page.dart';
import 'package:flutter_wan_android/pages/query_page.dart';
import 'package:flutter_wan_android/pages/register_page.dart';
import 'package:flutter_wan_android/pages/tab_profile/tab_coin_page.dart';
import 'package:flutter_wan_android/pages/tab_profile/tab_collect_page.dart';
import 'package:flutter_wan_android/pages/tab_profile/tab_rank_page.dart';
import 'package:flutter_wan_android/pages/tab_profile/tab_settings_page.dart';
import 'package:flutter_wan_android/pages/tab_profile/tab_share_page.dart';
import 'package:flutter_wan_android/pages/tree_page.dart';
import 'package:flutter_wan_android/pages/wx_article_page.dart';

/// 全局 context
final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

/// 路由列表
class MyRoutePath {
  final String location;
  dynamic extra;

  MyRoutePath(this.location);

  MyRoutePath.home() : location = "/";

  MyRoutePath.details() : location = "/details";

  MyRoutePath.trees({this.extra = ""}) : location = "/trees/$extra";

  MyRoutePath.query() : location = "/query";

  MyRoutePath.hotkey() : location = "/hotkey";

  MyRoutePath.login() : location = "/login";

  MyRoutePath.register() : location = "/register";

  MyRoutePath.collectList() : location = "/profile/collect_list";

  MyRoutePath.coinList() : location = "/profile/coin_list";

  MyRoutePath.settings() : location = "/profile/settings";

  MyRoutePath.shareList() : location = "/profile/share";

  MyRoutePath.wxArticleList() : location = "/wx_article";

  MyRoutePath.projectList() : location = "/projects";

  MyRoutePath.rankList() : location = "/rank";

  bool get isHome => location == "/";

  bool get isDetails => location == "/details";

  bool get isTree => location.contains("/trees/");

  bool get isQuery => location == "/query";

  bool get isHotkey => location == "/hotkey";

  bool get isLogin => location == "/login";

  bool get isRegister => location == "/register";

  bool get isCollectList => location == "/profile/collect_list";

  bool get isSettings => location == "/profile/settings";

  bool get isCoinList => location == "/profile/coin_list";

  bool get isShareList => location == "/profile/share";

  bool get isWxArticleList => location == "/wx_article";

  bool get isProjectList => location == "/projects";

  bool get isRankList => location == "/rank";
}

/// 构建页面
MaterialPage _buildPage(MyRoutePath path, args) {
  var page;
  if (path.isHome) {
    page = const MyHomePage(title: "title");
  } else if (path.isDetails) {
    page = DetailPage(
      model: args,
    );
  } else if (path.isTree) {
    page = TreePage(
      treeData: args,
      initialIndex: path.extra,
    );
  } else if (path.isQuery) {
    page = QueryPage(initKeyword: args);
  } else if (path.isHotkey) {
    page = const HotkeyPage();
  } else if (path.isLogin) {
    page = const LoginPage();
  } else if (path.isCollectList) {
    page = const CollectListPage();
  } else if (path.isSettings) {
    page = const SettingsPage();
  } else if (path.isRegister) {
    page = const RegisterPage();
  } else if (path.isCoinList) {
    page = const CoinPage();
  } else if (path.isRankList) {
    page = const RankPage();
  } else if (path.isShareList) {
    page = const ShareListPage();
  } else if (path.isWxArticleList) {
    page = WxArticlePage(publicId: args['id'], publicName: args['name']);
  } else if (path.isProjectList) {
    page = ProjectPage(projectId: args['id'], projectName: args['name']);
  } else {
    page = Container();
  }
  print("page=> $page");
  return _wrapPage(page, path.location);
}

/// 路由代理
class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  List<MaterialPage> _stack = [];
  Map<String, OnPopResult> _resultListeners = {};
  MyRoutePath _current = MyRoutePath.home();

  static MyRouterDelegate of(BuildContext context) {
    var delegate = Router.maybeOf(context)?.routerDelegate;
    assert(delegate is MyRouterDelegate, "delegate must be match");
    return delegate as MyRouterDelegate;
  }

  // 入栈
  void push(MyRoutePath path,
      {dynamic args, bool notify = true, OnPopResult? onPopResult}) {
    _current = path;
    var index = _getPathIndex(_stack, path);
    if (index != -1) {
      // 出栈至当前 page，不保留
      _stack = _stack.sublist(0, index);
    }
    if (_current.isHome) {
      _stack.clear();
    }
    _stack.add(_buildPage(path, args));
    if (onPopResult != null) {
      _resultListeners[path.location] = onPopResult;
    }
    if (notify) {
      notifyListeners();
    }
  }

  // 出栈
  void pop({bool notify = true, dynamic result}) {
    if (_stack.isNotEmpty) {
      // 移除监听
      var name = _stack.last.name;
      _resultListeners[name]?.call(result);
      _resultListeners.remove(name);
      // 出栈
      _stack.removeLast();
      if (notify) {
        notifyListeners();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_stack.isEmpty) {
      // 构建首页
      push(_current, notify: false);
    }
    return WillPopScope(
        child: Navigator(
          // 此处需设置 key，才能在 Navigator 之外的地方调用
          key: navigatorKey,
          // 直接赋值 _stack 的话是不会触发刷新的，结构成新的值才会刷新
          pages: [..._stack],
          onPopPage: (Route<dynamic> route, dynamic result) {
            var didPop = route.didPop(result);
            print(
                "android back press didPop => $didPop,${route.settings.name}");
            if (didPop) {
              pop(notify: false, result: result);
              return true;
            } else {
              return false;
            }
          },
        ),
        onWillPop: () async {
          var maybePop = await navigatorKey?.currentState?.maybePop();
          print("android back press maybePop => $maybePop");
          // 拦截物理返回键，当 Navigator 处理完成的时候才交由系统处理
          return !(maybePop ?? false);
        });
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey = routerKey;

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    push(configuration);
  }
}

class MyRouteInfoParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(MyRoutePath(routeInformation.location ?? "/"));
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath configuration) {
    return RouteInformation(location: configuration.location);
  }
}

/// 获取页面对应的 路由下标
_getPathIndex(List<MaterialPage> stack, MyRoutePath path) {
  for (var i = 0; i < stack.length; i++) {
    if (stack[i].name == path.location) {
      return i;
    }
  }
  return -1;
}

// 包装 MaterialPage
MaterialPage _wrapPage(Widget page, String path) {
  // name 暂时用作页面唯一识别码
  return MaterialPage(
      child: page,
      key: ValueKey(page.hashCode),
      name: path,
      restorationId: path);
}

typedef OnPopResult = Function(dynamic result);

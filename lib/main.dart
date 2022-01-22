import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/pages/detail_page.dart';
import 'package:flutter_wan_android/pages/home_page.dart';
import 'package:lx_base/utils/run_and_catch.dart';

void main() {
  runSafety(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final MyRouterDelegate _delegate = MyRouterDelegate();
  final MyRouteInfoParser _routeInfoParser = MyRouteInfoParser();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// 不知道原因，使用 MaterialApp.router 会导致 WillPopScope 无效
    // return MaterialApp.router(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   routerDelegate: _delegate,
    //   routeInformationParser: _routeInfoParser,
    // );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Router(
        routerDelegate: _delegate,
        routeInformationParser: _routeInfoParser,
      ),
    );
  }
}

class MyRoutePath {
  final String location;

  MyRoutePath(this.location);

  MyRoutePath.home() : location = "/";

  bool get isHome => location == "/";

  MyRoutePath.details() : location = "/details";

  bool get isDetails => location == "/details";
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  List<MaterialPage> _stack = [];
  MyRoutePath _current = MyRoutePath.home();

  static MyRouterDelegate of(BuildContext context) {
    var delegate = Router.maybeOf(context)?.routerDelegate;
    assert(delegate is MyRouterDelegate, "delegate must be match");
    return delegate as MyRouterDelegate;
  }

  void push(MyRoutePath path, {bool notify = true}) {
    // todo: 这里有问题
    _current = path;
    var index = _getPathIndex(path);
    if (index != -1) {
      // 出栈至当前 page，不保留
      _stack = _stack.sublist(0, index);
    }
    if (_current.isHome) {
      _stack.clear();
    }
    _stack.add(_buildPage(path));
    if (notify) {
      notifyListeners();
    }
  }

  void pop() {
    if (_stack.isNotEmpty) {
      _stack.removeLast();
      notifyListeners();
    }
  }

  // 获取页面对应的 路由下标
  _getPathIndex(MyRoutePath path) {
    for (var i = 0; i < _stack.length; i++) {
      if (_stack[i].restorationId == path.location) {
        return i;
      }
    }
    return -1;
  }

  /// 构建页面
  MaterialPage _buildPage(MyRoutePath path) {
    var page;
    if (path.isHome) {
      page = const MyHomePage(title: "title");
    } else if (path.isDetails) {
      page = const DetailPage();
    } else {
      page = Container();
    }
    print("page=> $page");
    return _wrapPage(page, path.location);
  }

  MaterialPage _wrapPage(Widget page, String path) {
    // restorationId 暂时用作页面唯一识别码
    return MaterialPage(
        child: page, key: ValueKey(page.hashCode), restorationId: path);
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
            print("android back press didPop => $didPop");
            if (didPop) {
              _stack.removeLast();
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
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {}
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

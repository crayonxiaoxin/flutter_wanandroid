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

  MyRouterDelegate _delegate = MyRouterDelegate();
  MyRouteInfoParser _routeInfoParser = MyRouteInfoParser();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  List<String> _stackPath = [];
  MyRoutePath _current = MyRoutePath.home();

  static MyRouterDelegate of(BuildContext context) {
    var delegate = Router.maybeOf(context)?.routerDelegate;
    assert(delegate is MyRouterDelegate, "delegate must be match");
    return delegate as MyRouterDelegate;
  }

  void push(MyRoutePath path, {bool notify = true}) {
    // todo: 这里有问题
    _current = path;
    var index = _stackPath.indexOf(path.location);
    if (index != -1) {
      _stack.sublist(0, index);
      _stackPath.sublist(0, index);
      print("path=>exists $index,${_stackPath.length}");
    }
    if (_current.isHome) {
      print("path=>ishome");
      _stack.clear();
      _stackPath.clear();
    }
    _stack.add(_buildPage(path));
    _stackPath.add(path.location);
    print("path=>${path.location},_stack=>${_stack.length}");
    if (notify) {
      print("notify");
      notifyListeners();
    }
  }

  void pop() {
    if (_stack.isNotEmpty) {
      _stack.removeLast();
      _stackPath.removeLast();
      notifyListeners();
    }
  }

  MaterialPage _buildPage(MyRoutePath path) {
    var page;
    if (path.isHome) {
      page = MyHomePage(title: "title");
    } else if (path.isDetails) {
      page = DetailPage();
    } else {
      page = Container();
    }
    print("page=> $page");
    return _wrapPage(page);
  }

  MaterialPage _wrapPage(Widget page) {
    return MaterialPage(child: page, key: ValueKey(page.hashCode));
  }

  @override
  Widget build(BuildContext context) {
    if (_stack.isEmpty) {
      print("build empty ${_stack.length}");
      push(_current, notify: false);
    }
    return WillPopScope(
        child: Navigator(
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

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/net/interceptor/response_interceptor.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_cache/lx_cache.dart';
import 'package:lx_net/lx_net.dart';

void main() {
  // runSafety(MyApp());
  LxNet.preInit(interceptor: ResponseInterceptor());
  runApp(MyApp());
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
    return FutureBuilder(
      future: LxCache.preInit(),
      builder: (context, snapshot) {
        var widget = snapshot.connectionState == ConnectionState.done
            ? Router(
                routerDelegate: _delegate,
                routeInformationParser: _routeInfoParser,
              )
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(), // 显示 loading
                ),
              );
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: widget,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

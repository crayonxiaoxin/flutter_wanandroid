import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wan_android/net/interceptor/response_interceptor.dart';
import 'package:flutter_wan_android/provider/providers.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:intl/intl.dart';
import 'package:lx_cache/lx_cache.dart';
import 'package:lx_net/lx_net.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

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
    print("locale=> ${Intl.getCurrentLocale()}");

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
        return MultiProvider(
          providers: providers,
          child: Consumer<ThemeProvider>(builder: (
            BuildContext context,
            ThemeProvider themeProvider,
            Widget? child,
          ) {
            return MaterialApp(
              theme: themeProvider.getTheme(),
              darkTheme: themeProvider.getTheme(isDarkMode: true),
              themeMode: themeProvider.getThemeMode(),
              home: widget,
              debugShowCheckedModeBanner: false,
              // 国际化
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: S.delegate.supportedLocales,
              onGenerateTitle: (context) {
                return S.current.app_name;
              },
            );
          }),
        );
      },
    );
  }
}

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:flutter_wan_android/getx/settings/settings_logic.dart';
import 'package:flutter_wan_android/net/interceptor/response_interceptor.dart';
import 'package:flutter_wan_android/provider/home_provider.dart';
import 'package:flutter_wan_android/provider/language_provider.dart';
import 'package:flutter_wan_android/provider/providers.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lx_base/utils/run_and_catch.dart';
import 'package:lx_cache/lx_cache.dart';
import 'package:lx_net/lx_net.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  _initWebView();
  LxNet.preInit(interceptor: ResponseInterceptor());
  // runApp(MyApp());
  // runSafety(MyApp());
  runSafety(const App());
}

class App extends StatelessWidget with AppPages {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsLogic = Get.put(SettingsLogic());
    settingsLogic.setTheme(settingsLogic.getThemeMode());
    return GetMaterialApp(
      initialRoute: Routes.Home,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
      transitionDuration: Get.defaultTransitionDuration,
      debugShowCheckedModeBanner: false,
      // 国际化
      locale: settingsLogic.currentLocale(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (context) {
        return S.of(context).app_name;
      },
    );
  }
}

Future<void> _initWebView() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
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
            : Scaffold(
                body: Center(
                  child: Container(
                    color: Colors.white,
                  ), // 显示 loading
                ),
              );
        return MultiProvider(
          providers: providers,
          child: Consumer3<ThemeProvider, LanguageProvider, HomeProvider>(
              builder: (
            BuildContext context,
            ThemeProvider themeProvider,
            LanguageProvider langProvider,
            HomeProvider homeProvider,
            Widget? child,
          ) {
            return MaterialApp(
              theme: themeProvider.getTheme(),
              darkTheme: themeProvider.getTheme(isDarkMode: true),
              themeMode:
                  themeProvider.getThemeMode(defaultMode: ThemeMode.system),
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
                return S.of(context).app_name;
              },
              locale: langProvider.currentLocale(),
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) {
                // 监听系统语言变化，跟随系统变化
                return langProvider.currentLocale();
              },
            );
          }),
        );
      },
    );
  }
}

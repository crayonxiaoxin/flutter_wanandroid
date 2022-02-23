import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:flutter_wan_android/net/interceptor/response_interceptor.dart';
import 'package:get/get.dart';
import 'package:lx_base/utils/run_and_catch.dart';
import 'package:lx_net/lx_net.dart';

import 'generated/l10n.dart';
import 'getx/settings/settings_logic.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initWebView();
  LxNet.preInit(interceptor: ResponseInterceptor());
  runSafety(App());
}

class App extends StatelessWidget with AppPages {
  App({Key? key}) : super(key: key);

  final settingsLogic = Get.put(SettingsLogic());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.Home,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
      transitionDuration: Get.defaultTransitionDuration,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
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
  if (!kIsWeb && Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
}

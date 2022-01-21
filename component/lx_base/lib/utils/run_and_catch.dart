import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 统一异常捕获
void runSafety(Widget app, {Function(Object error, StackTrace stack)? error}) {
  // 捕获框架异常
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kReleaseMode) {
      Zone.current.handleUncaughtError(
          details.exception, details.stack ?? StackTrace.empty);
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
  };
  // flutter 异常
  runZonedGuarded(() {
    runApp(app);
  },
      error ??
          (Object error, StackTrace stack) {
            print("统一异常捕获：$error");
          });
}

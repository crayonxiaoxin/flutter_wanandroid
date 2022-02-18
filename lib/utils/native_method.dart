import 'package:flutter/services.dart';

import '../constants.dart';

var _platform = const MethodChannel(Constants.methodChannel);

nativeToast(String message) {
  _platform.invokeMethod("toast", {"message": message});
}

nativeAlert(String message) {
  _platform.invokeMethod("alert-dialog", {"message": message});
}

Future<bool> nativeUseHttp() async {
  return await _platform.invokeMethod("use-http");
}

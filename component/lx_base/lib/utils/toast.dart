import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

/// 吐司
void toast(
  String? text, {
  Toast toastLength = Toast.LENGTH_LONG,
  ToastGravity gravity = ToastGravity.TOP,
  Color? backgroundColor,
  Color? textColor,
}) {
  if (text != null && text.isNotEmpty) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: toastLength,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

launchUrl(BuildContext context, String? url,
    {String? title, bool inApp = true}) {
  if (kIsWeb || !inApp) {
    _launchUrl(url);
  } else {
    // MyRouterDelegate.of(context).push(MyRoutePath.details(),
    //     args: DetailEntity(url, title: parseHtml(title)));
    Get.toNamed(Routes.Details, arguments: {"title": title, "url": url});
  }
}

void _launchUrl(String? url) async {
  if (url != null) {
    try {
      await launch(url);
    } catch (e) {
      print("launch url failed: $url");
    }
  }
}

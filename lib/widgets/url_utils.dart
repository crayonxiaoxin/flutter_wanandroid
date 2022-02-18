import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_wan_android/model/detail_entity.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/utils/html_utils.dart';
import 'package:url_launcher/url_launcher.dart';

launchUrl(BuildContext context, String? url,
    {String? title, bool inApp = true}) {
  if (kIsWeb || !inApp) {
    _launchUrl(url);
  } else {
    MyRouterDelegate.of(context).push(MyRoutePath.details(),
        args: DetailEntity(url, title: parseHtml(title)));
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

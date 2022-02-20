import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class DetailState {
  late RxString title;
  late RxString url;
  late RxBool loading;

  final GlobalKey webViewKey = GlobalKey();
  late InAppWebViewController? webViewController;
  final InAppWebViewGroupOptions webViewOptions = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useOnDownloadStart: true,
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false),
      android: AndroidInAppWebViewOptions(useHybridComposition: true),
      ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true));
  late final PullToRefreshController pullToRefreshController;
  var supportedSchemes = [
    "http",
    "https",
    "file",
    "chrome",
    "data",
    "javascript",
    "about"
  ];
  var interceptSchemes = ["tbopen", "openapp.jdmobile"];

  DetailState() {
    var args = Get.arguments;
    title = "${args['title']}".obs;
    url = "${args['url']}".obs;
    loading = true.obs;
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Colors.blue),
        onRefresh: () async {
          if (!kIsWeb) {
            if (Platform.isAndroid) {
              webViewController?.reload();
            } else if (Platform.isIOS) {
              webViewController?.loadUrl(
                  urlRequest:
                      URLRequest(url: await webViewController?.getUrl()));
            }
          }
        });
  }
}

import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/model/detail_entity.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/adaptive.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';
import 'package:provider/src/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final DetailEntity? model;

  const DetailPage({Key? key, required this.model}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends LxState<DetailPage> {
  bool loading = true;
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? _webViewController;
  final InAppWebViewGroupOptions _webViewOptions = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false),
      android: AndroidInAppWebViewOptions(useHybridComposition: true),
      ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true));
  late PullToRefreshController _pullToRefreshController;

  @override
  void initState() {
    super.initState();
    _pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Colors.blue),
        onRefresh: () async {
          if (!kIsWeb) {
            if (Platform.isAndroid) {
              _webViewController?.reload();
            } else if (Platform.isIOS) {
              _webViewController?.loadUrl(
                  urlRequest:
                      URLRequest(url: await _webViewController?.getUrl()));
            }
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var themeProvider = context.watch<ThemeProvider>();
    return WillPopScope(
        onWillPop: () async {
          MyRouterDelegate.of(context).pop(result: "test return value");
          return false;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              FlutterClipboard.copy(
                      "${widget.model?.title}:\n${widget.model?.url}")
                  .then((value) => toast(S.of(context).copy_clipboard));
            },
            child: const Icon(Icons.share),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          appBar: ImmersiveAppBar(
            gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent]),
            elevation: 2.0,
            leading: const BackButton(color: Colors.white),
            child: Center(
              child: Container(
                width: context.screenWidth * 0.7,
                alignment: Alignment.center,
                child: Text(
                  "${widget.model?.title}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                initialUrlRequest:
                    URLRequest(url: Uri.parse(widget.model?.url ?? "")),
                initialOptions: _webViewOptions,
                pullToRefreshController: _pullToRefreshController,
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    loading = true;
                  });
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    loading = false;
                  });
                },
                androidOnPermissionRequest:
                    (controller, origin, resource) async {
                  return PermissionRequestResponse(
                      resources: resource,
                      action: PermissionRequestResponseAction.GRANT);
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url!;

                  if (![
                    "http",
                    "https",
                    "file",
                    "chrome",
                    "data",
                    "javascript",
                    "about"
                  ].contains(uri.scheme)) {
                    if (await canLaunch(uri.toString())) {
                      // Launch the App
                      await launch(uri.toString());
                      // and cancel the request
                      return NavigationActionPolicy.CANCEL;
                    }
                  }

                  return NavigationActionPolicy.ALLOW;
                },
              ),
              AnimatedOpacity(
                opacity: loading ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ));
  }
}

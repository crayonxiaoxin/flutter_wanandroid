import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_wan_android/model/detail_entity.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/logger.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:lx_base/adaptive.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';

class DetailPage extends StatefulWidget {
  final DetailEntity? model;

  const DetailPage({Key? key, required this.model}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends LxState<DetailPage> {
  String? _title;
  bool loading = true;
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? _webViewController;
  final InAppWebViewGroupOptions _webViewOptions = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useOnDownloadStart: true,
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false),
      android: AndroidInAppWebViewOptions(useHybridComposition: true),
      ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true));
  late PullToRefreshController _pullToRefreshController;
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

  @override
  void initState() {
    super.initState();
    _title = widget.model?.title;
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
    return WillPopScope(
        onWillPop: () async {
          MyRouterDelegate.of(context).pop(result: "test return value");
          return false;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: _share,
            child: const Icon(Icons.share, color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          appBar: ImmersiveAppBar(
            gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent]),
            elevation: 2.0,
            leading: const BackButton(color: Colors.white),
            child: _buildAppbar(context),
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
                onTitleChanged: (controller, title) {
                  setState(() {
                    _title = title;
                  });
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
                onDownloadStart: (controller, uri) async {
                  logger.i(uri);
                  // 打开外部浏览器进行下载
                  if (await canLaunch(uri.toString())) {
                    await launch(uri.toString());
                  }
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url!;
                  if (!supportedSchemes.contains(uri.scheme)) {
                    // 拦截试图打开淘宝京东，例如简书
                    if (interceptSchemes.contains(uri.scheme)) {
                      toast(S.of(context).detail_intercept_open_app);
                    } else if (await canLaunch(uri.toString())) {
                      // Launch the App
                      await launch(uri.toString());
                    }
                    // and cancel the request
                    return NavigationActionPolicy.CANCEL;
                  }
                  return NavigationActionPolicy.ALLOW;
                },
                onReceivedServerTrustAuthRequest:
                    (controller, challenge) async {
                  return ServerTrustAuthResponse(
                      action: ServerTrustAuthResponseAction.PROCEED);
                },
              ),
              AnimatedOpacity(
                opacity: loading ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: const Center(child: CircularProgressIndicator()),
              )
            ],
          ),
        ));
  }

  Stack _buildAppbar(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: context.screenWidth * 0.7,
            alignment: Alignment.center,
            child: Text(
              "$_title",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          child: IconButton(
            icon: const Icon(
              Icons.public,
              color: Colors.white,
            ),
            onPressed: () {
              launchUrl(context, widget.model?.url, inApp: false);
            },
          ),
          right: 0,
          top: 0,
          bottom: 0,
        )
      ],
    );
  }

  void _share() async {
    await Share.share("${widget.model?.title}:\n${widget.model?.url}");
    // FlutterClipboard.copy(
    //         "${widget.model?.title}:\n${widget.model?.url}")
    //     .then((value) => toast(S.of(context).copy_clipboard));
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/utils/logger.dart';
import 'package:get/get.dart';
import 'package:lx_base/adaptive.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'detail_logic.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(DetailLogic());
    final state = logic.state;

    return WillPopScope(
        onWillPop: () async {
          // MyRouterDelegate.of(context).pop(result: "test return value");
          Get.back(result: "test return value");
          return false;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              logic.share();
            },
            child: const Icon(Icons.share, color: Colors.white),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          appBar: ImmersiveAppBar(
            gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent]),
            elevation: 2.0,
            leading: const BackButton(color: Colors.white),
            child: _buildAppbar(context, logic),
          ),
          body: Stack(
            children: [
              InAppWebView(
                key: state.webViewKey,
                initialUrlRequest: URLRequest(url: Uri.parse(state.url.value)),
                initialOptions: state.webViewOptions,
                pullToRefreshController: state.pullToRefreshController,
                onWebViewCreated: (controller) {
                  state.webViewController = controller;
                },
                onTitleChanged: (controller, title) {
                  state.title.value = title ?? "";
                },
                onLoadStart: (controller, url) {
                  state.loading.value = true;
                },
                onLoadStop: (controller, url) {
                  state.loading.value = false;
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
                  if (!state.supportedSchemes.contains(uri.scheme)) {
                    // 拦截试图打开淘宝京东，例如简书
                    if (state.interceptSchemes.contains(uri.scheme)) {
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
              Obx(() {
                return AnimatedOpacity(
                  opacity: state.loading.value ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: const Center(child: CircularProgressIndicator()),
                );
              })
            ],
          ),
        ));
  }

  _buildAppbar(BuildContext context, DetailLogic logic) {
    return Obx(() {
      return Stack(
        children: [
          Center(
            child: Container(
              width: context.screenWidth * 0.7,
              alignment: Alignment.center,
              child: Text(
                logic.state.title.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            child: IconButton(
              icon: const Icon(Icons.public, color: Colors.white),
              onPressed: () {
                logic.openBrowser(context);
              },
            ),
            right: 0,
            top: 0,
            bottom: 0,
          )
        ],
      );
    });
  }
}

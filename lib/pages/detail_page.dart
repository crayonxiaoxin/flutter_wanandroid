import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/detail_entity.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/adaptive.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final DetailEntity? model;

  const DetailPage({Key? key, required this.model}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends LxState<DetailPage> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
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
            onPressed: () {
              FlutterClipboard.copy(
                      "${widget.model?.title}:\n${widget.model?.url}")
                  .then((value) => toast("已将链接复制至剪贴板"));
            },
            child: const Icon(Icons.share),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: ImmersiveAppBar(
            gradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
            ),
            elevation: 2.0,
            leading: const BackButton(),
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
              WebView(
                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (url) {
                  setState(() {
                    loading = true;
                  });
                },
                onPageFinished: (url) {
                  setState(() {
                    loading = false;
                  });
                },
                initialUrl: widget.model?.url,
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

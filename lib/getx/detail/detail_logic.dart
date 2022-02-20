import 'package:flutter/cupertino.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'detail_state.dart';

class DetailLogic extends GetxController {
  final DetailState state = DetailState();

  share() async {
    await Share.share("${state.title.value}:\n${state.url.value}");
    // FlutterClipboard.copy(
    //         "${widget.model?.title}:\n${widget.model?.url}")
    //     .then((value) => toast(S.of(context).copy_clipboard));
  }

  openBrowser(BuildContext context) {
    launchUrl(context, state.url.value, inApp: false);
  }
}

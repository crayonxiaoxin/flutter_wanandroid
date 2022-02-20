import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:get/get.dart';

class TreeState {
  late List<String> tabs;
  TreeState() {
    var context = Get.context!;
    tabs = [
      S.of(context).top_tab_tree,
      S.of(context).top_tab_navi,
      S.of(context).top_tab_wx,
      S.of(context).top_tab_project
    ];
  }
}

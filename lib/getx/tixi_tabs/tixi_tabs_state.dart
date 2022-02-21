import 'package:get/get.dart';

import '../../model/tree_entity.dart';

class TixiTabsState {
  late RxList<TreeDataChildren> tabs;
  late int initialIndex;
  late String title;

  TixiTabsState() {
    var args = Get.arguments;
    title = args['item'].name;
    initialIndex = args['index'];
    tabs = <TreeDataChildren>[].obs;
    tabs.addAll(args['item'].children);
  }
}

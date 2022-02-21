import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tixi_tabs_state.dart';

class TixiTabsLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final TixiTabsState state = TixiTabsState();

  TixiTabsLogic() {
    tabController = TabController(
        length: state.tabs.length,
        vsync: this,
        initialIndex: state.initialIndex);
  }
}

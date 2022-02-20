import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tree_state.dart';

class TreeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final TreeState state = TreeState();

  TreeLogic() {
    tabController = TabController(length: state.tabs.length, vsync: this);
  }
}

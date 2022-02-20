import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/lx_page.dart';
import 'package:flutter_wan_android/getx/navi/navi_view.dart';
import 'package:flutter_wan_android/getx/tixi/tixi_view.dart';
import 'package:flutter_wan_android/pages/tab_sys/tab_project_page.dart';
import 'package:flutter_wan_android/pages/tab_sys/tab_wechat_page.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import 'tree_logic.dart';

class TreePage extends StatelessWidget {
  const TreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TreeLogic());

    return Scaffold(
      appBar: ImmersiveAppBar(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
        ),
        elevation: 2.0,
        height: 46,
        child: _buildTabs(logic),
      ),
      body: TabBarView(
        controller: logic.tabController,
        children: [
          LxPage(TixiPage()),
          LxPage(NaviPage()),
          TabWechatPage(),
          TabProjectPage()
        ],
      ),
    );
  }

  _buildTabs(logic) {
    return Center(
      child: TabBar(
        isScrollable: true,
        controller: logic.tabController,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[200],
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          ...logic.state.tabs.map((e) {
            return Tab(
              text: e,
            );
          }).toList()
        ],
      ),
    );
  }
}

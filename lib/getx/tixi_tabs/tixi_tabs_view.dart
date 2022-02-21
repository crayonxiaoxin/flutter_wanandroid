import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/lx_page.dart';
import 'package:flutter_wan_android/getx/tixi_articles/tixi_articles_view.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import 'tixi_tabs_logic.dart';

class TixiTabsPage extends StatelessWidget {
  final logic = Get.put(TixiTabsLogic());
  final state = Get.find<TixiTabsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ImmersiveAppBar(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
        ),
        elevation: 2.0,
        height: 80,
        child: Column(
          children: [
            SizedBox(
              height: 46,
              child: Stack(
                children: [
                  const BackButton(color: Colors.white),
                  Center(
                    child: Text(
                      state.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            _buildTabs(),
          ],
        ),
      ),
      body: TabBarView(
        controller: logic.tabController,
        children: [
          ...state.tabs.map((e) {
            // return TabTreeArticlePage(cid: e.id ?? 0);
            return LxPage(TixiArticlesPage(cid: e.id ?? 0));
          }).toList()
        ],
      ),
    );
  }

  _buildTabs() {
    return SizedBox(
      height: 34,
      child: Center(
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
            ...state.tabs.map((e) {
              return Tab(
                text: e.name,
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}

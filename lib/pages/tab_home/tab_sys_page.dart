import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/pages/tab_sys/tab_navi_page.dart';
import 'package:flutter_wan_android/pages/tab_sys/tab_tree_page.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class TabSysPage extends StatefulWidget {
  const TabSysPage({Key? key}) : super(key: key);

  @override
  _TabSysPageState createState() => _TabSysPageState();
}

class _TabSysPageState extends LxState<TabSysPage>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    tabs = [S.current.top_tab_tree, S.current.top_tab_navi];
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    tabs = [S.of(context).top_tab_tree, S.of(context).top_tab_navi];
    return Scaffold(
      appBar: ImmersiveAppBar(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
        ),
        elevation: 2.0,
        height: 46,
        child: _buildTabs(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [TabTreePage(), TabNaviPage()],
      ),
    );
  }

  _buildTabs() {
    return Center(
      child: TabBar(
        isScrollable: true,
        controller: _tabController,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[200],
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          ...tabs.map((e) {
            return Tab(
              text: e,
            );
          }).toList()
        ],
      ),
    );
  }
}

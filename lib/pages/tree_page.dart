import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/pages/tab_tree/tab_tree_article_page.dart';
import 'package:lx_base/lx_state.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class TreePage extends StatefulWidget {
  final TreeData treeData;
  final int initialIndex;

  const TreePage({Key? key, required this.treeData, this.initialIndex = 0})
      : super(key: key);

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends LxState<TreePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  List<TreeDataChildren> tabs = [];

  @override
  void initState() {
    super.initState();
    tabs = widget.treeData.children ?? List.empty();
    _tabController = TabController(
        length: tabs.length, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      "${widget.treeData.name}",
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
        controller: _tabController,
        children: [
          ...tabs.map((e) {
            return TabTreeArticlePage(cid: e.id ?? 0);
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
          controller: _tabController,
          indicatorColor: Colors.white,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            ...tabs.map((e) {
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

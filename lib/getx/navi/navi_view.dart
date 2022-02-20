import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/model/navi_entity.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:get/get.dart';

import 'navi_logic.dart';

class NaviPage extends AbsListPage<NaviLogic> {
  NaviPage({Key? key}) : super(key: key, logic: Get.put(NaviLogic()));

  @override
  Widget buildChild(BuildContext context) {
    return ListView.builder(
        itemCount: state.dataList.length,
        itemBuilder: (context, index) {
          return _buildFlowCard(context, state.dataList[index]);
        });
  }

  _buildFlowCard(BuildContext context, NaviData item) {
    var children = item.articles ?? List.empty();
    return TagGroup("${item.name}", children: [
      ...children.map((e) {
        return TagGroupItem(
          "${e.title}",
          onPressed: () {
            launchUrl(context, e.link, title: e.title);
          },
        );
      }).toList()
    ]);
  }
}

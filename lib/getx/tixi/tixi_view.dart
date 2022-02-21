import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';
import 'package:get/get.dart';

import 'tixi_logic.dart';

class TixiPage extends AbsListPage<TixiLogic> {
  TixiPage({Key? key}) : super(key: key, logic: Get.put(TixiLogic()));

  @override
  Widget buildChild(BuildContext context) {
    return ListView.builder(
        itemCount: state.dataList.length,
        itemBuilder: (context, index) {
          return _buildFlowCard(context, state.dataList[index]);
        });
    ;
  }

  _buildFlowCard(BuildContext context, TreeData item) {
    var children = item.children ?? List.empty();
    return TagGroup("${item.name}", children: [
      ...children.map((e) {
        return TagGroupItem(
          "${e.name}",
          onPressed: () {
            Get.toNamed(Routes.TixiTabs,
                arguments: {"index": children.indexOf(e), "item": item});
            // MyRouterDelegate.of(context).push(
            //     MyRoutePath.trees(extra: children.indexOf(e)),
            //     args: item);
          },
        );
      }).toList()
    ]);
  }
}

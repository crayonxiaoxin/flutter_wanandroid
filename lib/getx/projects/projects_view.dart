import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';
import 'package:get/get.dart';

import 'projects_logic.dart';

class ProjectsPage extends AbsListPage<ProjectsLogic> {
  ProjectsPage({Key? key}) : super(key: key, logic: Get.put(ProjectsLogic()));

  @override
  Widget buildChild(BuildContext context) {
    return ListView(children: [_buildFlowCard(context, state.dataList.value)]);
  }

  _buildFlowCard(BuildContext context, List<TreeData> children) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...children.map((e) {
            return TagGroupItem(
              "${e.name}",
              onPressed: () {
                Get.toNamed(Routes.ProjectList,
                    arguments: {"id": e.id, "name": e.name});
                // MyRouterDelegate.of(context).push(MyRoutePath.projectList(),
                //     args: {"id": e.id, "name": e.name});
              },
            );
          }).toList()
        ],
      ),
    );
  }
}

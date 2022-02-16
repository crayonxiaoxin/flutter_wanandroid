import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';

class TabProjectPage extends StatefulWidget {
  const TabProjectPage({Key? key}) : super(key: key);

  @override
  _TabProjectPageState createState() => _TabProjectPageState();
}

class _TabProjectPageState
    extends LxListState<TreeData, TreeEntity, TabProjectPage> {
  @override
  get enablePullUp => false;

  @override
  Widget get child => ListView(children: [_buildFlowCard(context, dataList)]);

  @override
  Future<TreeEntity> getData(int pageIndex, int pageSize) {
    return SysDao.getProjectTree();
  }

  @override
  List<TreeData> parseList(TreeEntity res) {
    return res.data ?? List.empty();
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
                MyRouterDelegate.of(context).push(MyRoutePath.projectList(),
                    args: {"id": e.id, "name": e.name});
              },
            );
          }).toList()
        ],
      ),
    );
  }
}

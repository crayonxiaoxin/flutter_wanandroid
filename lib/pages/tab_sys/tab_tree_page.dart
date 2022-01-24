import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';

class TabTreePage extends StatefulWidget {
  const TabTreePage({Key? key}) : super(key: key);

  @override
  _TabTreePageState createState() => _TabTreePageState();
}

class _TabTreePageState extends LxListState<TreeData, TreeEntity, TabTreePage> {
  @override
  get enablePullUp => false;

  @override
  Widget get child => ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return _buildFlowCard(context, dataList[index]);
      });

  @override
  Future<TreeEntity> getData(int pageIndex) {
    return SysDao.getTree();
  }

  @override
  List<TreeData> parseList(TreeEntity res) {
    return res.data ?? List.empty();
  }

  _buildFlowCard(BuildContext context, TreeData item) {
    var children = item.children ?? List.empty();
    return TagGroup("${item.name}", children: [
      ...children.map((e) {
        return TagGroupItem(
          "${e.name}",
          onPressed: () {
            MyRouterDelegate.of(context).push(
                MyRoutePath.trees(extra: children.indexOf(e)),
                args: item);
          },
        );
      }).toList()
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/navi_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';

class TabNaviPage extends StatefulWidget {
  const TabNaviPage({Key? key}) : super(key: key);

  @override
  _TabNaviPageState createState() => _TabNaviPageState();
}

class _TabNaviPageState extends LxListState<NaviData, NaviEntity, TabNaviPage> {
  @override
  get enablePullUp => false;

  @override
  Widget get child => ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return _buildFlowCard(context, dataList[index]);
      });

  @override
  Future<NaviEntity> getData(int pageIndex) {
    return SysDao.getNavigation();
  }

  @override
  List<NaviData> parseList(NaviEntity res) {
    return res.data ?? List.empty();
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

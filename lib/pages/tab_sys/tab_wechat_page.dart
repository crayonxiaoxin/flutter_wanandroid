import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/wx_public_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';

class TabWechatPage extends StatefulWidget {
  const TabWechatPage({Key? key}) : super(key: key);

  @override
  _TabWechatPageState createState() => _TabWechatPageState();
}

class _TabWechatPageState
    extends LxListState<WxPublicData, WxPublicEntity, TabWechatPage> {
  @override
  get enablePullUp => false;

  @override
  Widget get child => ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return _buildItem(context, dataList[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
              indent: 16, endIndent: 16, color: Colors.grey[100], height: 1);
        },
      );

  @override
  Future<WxPublicEntity> getData(int pageIndex, int pageSize) {
    return SysDao.getWxPublic();
  }

  @override
  List<WxPublicData> parseList(WxPublicEntity res) {
    return res.data ?? List.empty();
  }

  _buildItem(BuildContext context, WxPublicData item) {
    return InkWell(
      onTap: () {
        MyRouterDelegate.of(context).push(MyRoutePath.wxArticleList(),
            args: {"id": item.id ?? 0, "name": item.name ?? ""});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Text("${item.name}", style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}

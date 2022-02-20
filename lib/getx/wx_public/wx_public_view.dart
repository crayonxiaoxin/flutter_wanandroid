import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/model/wx_public_entity.dart';
import 'package:get/get.dart';

import 'wx_public_logic.dart';

class WxPublicPage extends AbsListPage<WxPublicLogic> {
  WxPublicPage({Key? key}) : super(key: key, logic: Get.put(WxPublicLogic()));

  @override
  Widget buildChild(BuildContext context) {
    return ListView.separated(
      itemCount: state.dataList.length,
      itemBuilder: (context, index) {
        return _buildItem(context, state.dataList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
            indent: 16, endIndent: 16, color: Colors.grey[100], height: 1);
      },
    );
  }

  _buildItem(BuildContext context, WxPublicData item) {
    return InkWell(
      onTap: () {
        // MyRouterDelegate.of(context).push(MyRoutePath.wxArticleList(),
        //     args: {"id": item.id ?? 0, "name": item.name ?? ""});
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("${item.name}", style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}

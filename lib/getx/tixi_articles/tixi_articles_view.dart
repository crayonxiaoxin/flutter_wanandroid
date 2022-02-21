import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:get/get.dart';

import '../../widgets/article_item_card.dart';
import 'tixi_articles_logic.dart';

class TixiArticlesPage extends AbsListPage<TixiArticlesLogic> {
  final int cid;

  TixiArticlesPage({Key? key, required this.cid})
      : super(key: key, logic: Get.put(TixiArticlesLogic(), tag: "$cid"));

  @override
  Widget buildChild(BuildContext context) {
    state.cid = cid;
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: state.dataList.length,
        itemBuilder: (context, index) {
          return ArticleItemCard(
            state.dataList[index],
            showDetail: true,
            onCollect: (collect) {
              state.dataList[index].collect = collect;
            },
          );
        });
  }
}

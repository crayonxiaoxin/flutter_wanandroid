import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/widgets/article_item_card.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import 'qa_logic.dart';

class QaPage extends AbsListPage<QaLogic> {
  QaPage({Key? key}) : super(key: key, logic: Get.put(QaLogic()));

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            Center(
              child: Text(
                S.current.bottom_tab_qa,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildChild(BuildContext context) {
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

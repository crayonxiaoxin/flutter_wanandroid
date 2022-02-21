import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../generated/l10n.dart';
import '../../widgets/article_item_card.dart';
import 'share_list_logic.dart';

class ShareListPage extends AbsListPage<ShareListLogic> {
  ShareListPage({Key? key}) : super(key: key, logic: Get.put(ShareListLogic()));

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2,
      leading: const BackButton(color: Colors.white),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            Center(
              child: Text(
                S.current.profile_share,
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

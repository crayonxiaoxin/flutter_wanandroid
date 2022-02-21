import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../generated/l10n.dart';
import '../../widgets/collect_item_card.dart';
import 'collect_list_logic.dart';

class CollectListPage extends AbsListPage<CollectListLogic> {
  CollectListPage({Key? key})
      : super(key: key, logic: Get.put(CollectListLogic()));

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
                S.of(context).profile_favorite,
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
          return CollectItemCard(
            state.dataList[index],
            showDetail: true,
            onCollect: (collect) {
              state.dataList.removeAt(index);
            },
          );
        });
  }
}

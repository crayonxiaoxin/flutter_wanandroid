import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../generated/l10n.dart';
import '../../model/coin_list_entity.dart';
import '../../widgets/animate_int.dart';
import 'coin_logic.dart';

class CoinPage extends AbsListPage<CoinLogic> {
  CoinPage({Key? key}) : super(key: key, logic: Get.put(CoinLogic()));

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2,
      height: 160,
      child: _buildAppbarContent(context),
    );
  }

  _buildAppbarContent(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 46,
          child: Stack(
            children: [
              const Positioned(
                child: BackButton(color: Colors.white),
                left: 0,
                top: 0,
                bottom: 0,
              ),
              Center(
                child: Text(
                  S.of(context).profile_coin,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                child: IconButton(
                    icon: const Icon(Icons.query_stats_outlined),
                    color: Colors.white,
                    onPressed: () {
                      Get.toNamed(Routes.Ranking);
                      // MyRouterDelegate.of(context)
                      //     .push(MyRoutePath.rankList());
                    }),
                right: 0,
                top: 0,
                bottom: 0,
              ),
            ],
          ),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Obx(() {
            return AnimatedCount(
              value: state.coinCount.value,
              duration: const Duration(milliseconds: 500),
              style: TextStyle(fontSize: 40, color: Colors.white, shadows: [
                Shadow(
                    color: Colors.grey.shade700,
                    blurRadius: 3,
                    offset: const Offset(2, 2))
              ]),
            );
          }),
        )),
      ],
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: state.dataList.length,
        itemBuilder: (context, index) {
          return _item(state.dataList[index]);
        });
  }

  Widget _item(CoinListDatas item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.reason}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text("${item.desc}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ),
              ],
            ),
            Text("${(item.coinCount ?? 0) > 0 ? "+" : ""}${item.coinCount}",
                style: const TextStyle(fontSize: 14, color: Colors.blue))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../generated/l10n.dart';
import '../../net/dao/login_dao.dart';
import '../../widgets/animate_int.dart';
import '../../widgets/url_utils.dart';
import 'ranking_logic.dart';

class RankingPage extends AbsListPage<RankingLogic> {
  RankingPage({Key? key}) : super(key: key, logic: Get.put(RankingLogic()));

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2,
      height: 168,
      child: _buildAppbarContent(context),
    );
  }

  Column _buildAppbarContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  S.of(context).profile_rank,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      launchUrl(
                          context, "https://www.wanandroid.com/blog/show/2653",
                          title: "积分规则");
                    }),
                right: 0,
                top: 0,
                bottom: 0,
              )
            ],
          ),
        ),
        Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedCount(
                value: state.rankCount.value,
                duration: const Duration(milliseconds: 500),
                style: TextStyle(fontSize: 40, color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.grey.shade700,
                      blurRadius: 3,
                      offset: const Offset(2, 2))
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                  child: _item(
                      rank: state.rankCount.value,
                      username: "${LoginDao.userInfo()?.username}",
                      coin: state.coinCount.value,
                      coinColor: Colors.white,
                      background: Colors.white30)),
            ],
          );
        }),
      ],
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return ListView.separated(
      itemCount: state.dataList.length,
      itemBuilder: (context, index) {
        var item = state.dataList[index];
        return _item(
            rank: item.rank, username: item.username, coin: item.coinCount);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
            color: Colors.grey.shade200, height: 1, indent: 16, endIndent: 16);
      },
    );
  }

  Widget _item(
      {rank,
      username,
      coin,
      Color? coinColor = Colors.blue,
      Color? background}) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: background,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 8),
                  constraints: const BoxConstraints(minWidth: 50),
                  child: Text(
                    "$rank",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "$username",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Text("$coin",
                style: TextStyle(
                    fontSize: 16,
                    color: coinColor,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

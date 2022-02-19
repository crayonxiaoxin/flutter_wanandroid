import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:flutter_wan_android/widgets/article_item_card.dart';
import 'package:flutter_wan_android/widgets/home_banner.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/adaptive_container.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import 'home_logic.dart';

class HomePage extends AbsListPage<HomeLogic> {
  HomePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2.0,
      builder: (context) {
        return Stack(
          children: [
            Center(
              child: Text(
                S.of(context).app_name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // MyRouterDelegate.of(context).push(MyRoutePath.hotkey());
                },
              ),
              right: 0,
              top: 0,
              bottom: 0,
            )
          ],
        );
      },
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    List<HomeBannerData> banners = state.banners.value;
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: state.dataList.length + (banners.isNotEmpty ? 1 : 0),
        itemBuilder: (context, index) {
          if (banners.isNotEmpty && index == 0) {
            return _banners(banners);
          }
          if (banners.isNotEmpty) index = index - 1;
          return ArticleItemCard(
            state.dataList[index],
            showDetail: true,
            onCollect: (collect) {
              state.dataList[index].collect = collect;
            },
          );
        });
  }

  @override
  HomeLogic get logic => Get.put(HomeLogic());

  _banners(List<HomeBannerData> banners) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
      child: AdaptiveContainer(
        builder: (h) {
          return HomeBanner(
            banners,
            bannerHeight: h,
            padding: const EdgeInsets.symmetric(horizontal: 8),
          );
        },
      ),
    );
  }
}
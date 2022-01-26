import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/article_item_card.dart';
import 'package:flutter_wan_android/widgets/home_banner.dart';
import 'package:lx_base/widget/adaptive_container.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState
    extends LxListState<HomeArticleDatas, HomeArticleEntity, TabHomePage> {
  List<HomeBannerData> banners = [];

  // @override
  // var appBar = ImmersiveAppBar(
  //   backgroundColor: Colors.blue,
  //   elevation: 2,
  //   height: 50,
  //   child: Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     child: InkWell(
  //       onTap: () {
  //         toast("to search");
  //       },
  //       child: Container(
  //         decoration: BoxDecoration(
  //             color: Colors.white, borderRadius: BorderRadius.circular(16)),
  //         padding: const EdgeInsets.only(right: 6),
  //         child: const Icon(
  //           Icons.search,
  //           color: Colors.grey,
  //         ),
  //         alignment: Alignment.centerRight,
  //       ),
  //     ),
  //   ),
  // );

  @override
  var appBar = ImmersiveAppBar(
    gradient: const LinearGradient(
      colors: [Colors.blueAccent, Colors.lightBlueAccent],
    ),
    elevation: 2.0,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            const Center(
              child: Text(
                "玩安卓",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () {
                  MyRouterDelegate.of(context).push(MyRoutePath.hotkey());
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              right: 0,
              top: 0,
              bottom: 0,
            )
          ],
        ),
      );
    },
  );

  @override
  Widget get child => ListView.builder(
      itemCount: dataList.length + (banners.isNotEmpty ? 1 : 0),
      itemBuilder: (context, index) {
        if (banners.isNotEmpty && index == 0) {
          return _banners();
        }
        if (banners.isNotEmpty) index = index - 1;
        return ArticleItemCard(
          dataList[index],
          showDetail: true,
          onCollect: (collect) {
            dataList[index].collect = collect;
          },
        );
      });

  @override
  Future<HomeArticleEntity> getData(int pageIndex, int pageSize) {
    return HomeDao.getArticles(page: pageIndex, pageSize: pageSize);
  }

  @override
  List<HomeArticleDatas> parseList(HomeArticleEntity res) {
    return res.datas ?? List.empty();
  }

  // 在第一次加载之后，是否被清空
  @override
  var isLoadInitClear = false;

  @override
  void onLoading({bool isLoadMore = true}) {
    if (!isLoadMore) {
      _loadBanners();
      _loadTopArticles();
    }
    super.onLoading(isLoadMore: isLoadMore);
  }

  void _loadBanners() async {
    try {
      var res = await HomeDao.getBanners();
      if (res.data != null) {
        setState(() {
          banners = res.data!;
        });
      }
    } catch (e) {
      print("load banner failed: $e");
    }
  }

  void _loadTopArticles() async {
    try {
      var res = await HomeDao.getTopArticles();
      if (res.data != null) {
        setState(() {
          dataList = [...res.data!, ...dataList];
        });
      }
    } catch (e) {
      print("load top articles failed: $e");
    }
  }

  _banners() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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

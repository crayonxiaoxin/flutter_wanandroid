import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/utils/string_util.dart';
import 'package:flutter_wan_android/widgets/home_banner.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:lx_base/utils/toast.dart';
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

  @override
  var appBar = ImmersiveAppBar(
    backgroundColor: Colors.blue,
    elevation: 2,
    height: 50,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          toast("to search");
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.only(right: 6),
          child: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          alignment: Alignment.centerRight,
        ),
      ),
    ),
  );

  @override
  Widget get child => ListView.builder(
      itemCount: dataList.length + (banners.isNotEmpty ? 1 : 0),
      itemBuilder: (context, index) {
        if (banners.isNotEmpty && index == 0) {
          return _banners();
        }
        if (banners.isNotEmpty) index = index - 1;
        return _articleItem(dataList[index]);
      });

  @override
  Future<HomeArticleEntity> getData(int pageIndex) {
    return HomeDao.getArticles(page: pageIndex);
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

  Widget _articleItem(HomeArticleDatas item) {
    var username = (item.author != null && item.author!.isNotEmpty)
        ? item.author
        : item.shareUser;
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[100]!, blurRadius: 5.0, spreadRadius: 2.0)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          _handleItemClick(item);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "$username",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      ..._articleTags(item.tags)
                    ],
                  ),
                ),
                Text("${item.niceShareDate}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(replaceHtmlEntity(item.title),
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (item.type == 1)
                      const Text(
                        "置顶  ",
                        style:
                            TextStyle(fontSize: 12, color: Colors.orangeAccent),
                      ),
                    Text(
                      "${item.superChapterName} · ${item.chapterName}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    _favorite(item);
                  },
                  child: item.collect == true
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _articleTags(List<HomeArticleDatasTags>? tags) {
    if (tags == null) return [];
    return tags.map((e) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blue)),
        child: Text(
          "${e.name}",
          style: const TextStyle(fontSize: 12, color: Colors.blue),
        ),
      );
    }).toList();
  }

  void _favorite(HomeArticleDatas item) {
    toast("favorite: ${item.title}");
  }

  void _handleItemClick(HomeArticleDatas item) {
    launchUrl(context, item.link, title: item.title);
  }
}

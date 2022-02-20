import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';

import 'home_state.dart';

class HomeLogic extends AbsListLogic<HomeArticleDatas, HomeState> {
  HomeLogic() : super(HomeState());

  @override
  Future<List<HomeArticleDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getArticles(page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }

  @override
  void onLoading(
      {bool isLoadMore = true,
      VoidCallback? onComplete,
      VoidCallback? onFailed,
      VoidCallback? onNoData}) async {
    if (!isLoadMore) {
      var canShowBanners = true;
      var canShowTopArticles = true;
      if (canShowBanners) {
        loadBanners();
      }
      if (canShowTopArticles) {
        loadTopArticles();
      }
    }
    super.onLoading(
        isLoadMore: isLoadMore,
        onComplete: onComplete,
        onFailed: onFailed,
        onNoData: onNoData);
  }

  void loadBanners() async {
    try {
      var res = await HomeDao.getBanners();
      if (res.data != null) {
        state.banners.value = res.data!;
      }
    } catch (e) {
      print("load banner failed: $e");
    }
  }

  void loadTopArticles() async {
    try {
      var res = await HomeDao.getTopArticles();
      if (res.data != null) {
        state.dataList.value = [...res.data!, ...state.dataList];
      }
    } catch (e) {
      print("load top articles failed: $e");
    }
  }
}

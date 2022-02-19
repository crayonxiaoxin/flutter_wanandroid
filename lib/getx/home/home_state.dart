import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeState extends AbsListState<HomeArticleDatas> {
  late RxList<HomeBannerData> banners;

  HomeState() : super() {
    banners = <HomeBannerData>[].obs;
  }

  @override
  bool get isLoadInitClear => false;
}

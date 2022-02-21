import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:get/get.dart';

import '../../model/home_article_entity.dart';

class WxArticlesState extends AbsListState<HomeArticleDatas> {
  late int publicId;

  late String publicName;

  WxArticlesState() {
    var args = Get.arguments;
    publicId = args['id'];
    publicName = args['name'];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/utils/logger.dart';
import 'package:get/get.dart';

class QueryState extends AbsListState<HomeArticleDatas> {
  late RxString keyword;
  QueryState() {
    var args = Get.arguments;
    keyword = "${args['keyword']}".obs;
    logger.e(keyword);
    textEditingController.text = keyword.value;
  }

  final TextEditingController textEditingController = TextEditingController();
}
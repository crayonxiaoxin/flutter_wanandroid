import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:get/get.dart';

class QueryState extends AbsListState<HomeArticleDatas> {
  late RxString keyword;
  QueryState() {
    var args = Get.arguments;
    keyword = args['keyword'].obs;
  }

  final TextEditingController textEditingController = TextEditingController();
}

import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:get/get.dart';

import '../../model/home_article_entity.dart';

class ProjectListState extends AbsListState<HomeArticleDatas> {
  late final int projectId;
  late final String projectName;

  ProjectListState() {
    var args = Get.arguments;
    projectId = args['id'];
    projectName = args['name'];
  }
}

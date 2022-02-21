import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';

import '../../net/dao/home_dao.dart';
import 'project_list_state.dart';

class ProjectListLogic
    extends AbsListLogic<HomeArticleDatas, ProjectListState> {
  ProjectListLogic() : super(ProjectListState());

  @override
  Future<List<HomeArticleDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getProjects(state.projectId,
        page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }
}

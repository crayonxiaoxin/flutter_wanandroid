import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';

import 'projects_state.dart';

class ProjectsLogic extends AbsListLogic<TreeData, ProjectsState> {
  ProjectsLogic() : super(ProjectsState());

  @override
  Future<List<TreeData>> getList(int pageIndex, int pageSize) async {
    var res = await SysDao.getProjectTree();
    return res.data ?? List.empty();
  }
}

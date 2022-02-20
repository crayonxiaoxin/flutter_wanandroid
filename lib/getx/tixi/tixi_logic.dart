import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';

import 'tixi_state.dart';

class TixiLogic extends AbsListLogic<TreeData, TixiState> {
  TixiLogic() : super(TixiState());

  @override
  Future<List<TreeData>> getList(int pageIndex, int pageSize) async {
    var res = await SysDao.getTree();
    return res.data ?? List.empty();
  }
}

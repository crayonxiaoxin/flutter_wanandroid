import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/navi_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';

import 'navi_state.dart';

class NaviLogic extends AbsListLogic<NaviData, NaviState> {
  NaviLogic() : super(NaviState());

  @override
  Future<List<NaviData>> getList(int pageIndex, int pageSize) async {
    var res = await SysDao.getNavigation();
    return res.data ?? List.empty();
  }
}

import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/wx_public_entity.dart';
import 'package:flutter_wan_android/net/dao/system_dao.dart';

import 'wx_public_state.dart';

class WxPublicLogic extends AbsListLogic<WxPublicData, WxPublicState> {
  WxPublicLogic() : super(WxPublicState());

  @override
  Future<List<WxPublicData>> getList(int pageIndex, int pageSize) async {
    var res = await SysDao.getWxPublic();
    return res.data ?? List.empty();
  }
}

import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';

import '../../model/collect_entity.dart';
import '../../net/dao/home_dao.dart';
import 'collect_list_state.dart';

class CollectListLogic extends AbsListLogic<CollectDatas, CollectListState> {
  CollectListLogic() : super(CollectListState());

  @override
  Future<List<CollectDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getCollectList(page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }
}

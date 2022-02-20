import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';

import 'qa_state.dart';

class QaLogic extends AbsListLogic<HomeArticleDatas, QaState> {
  QaLogic() : super(QaState());

  @override
  Future<List<HomeArticleDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getQAs(page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }
}

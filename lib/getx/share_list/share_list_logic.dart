import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';

import '../../net/dao/home_dao.dart';
import 'share_list_state.dart';

class ShareListLogic extends AbsListLogic<HomeArticleDatas, ShareListState> {
  ShareListLogic() : super(ShareListState());

  @override
  Future<List<HomeArticleDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getPrivateShareArticles(
        page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }
}

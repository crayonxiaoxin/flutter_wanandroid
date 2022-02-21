import 'package:flutter_wan_android/model/home_article_entity.dart';

import '../../net/dao/home_dao.dart';
import '../abs_list/abs_list_logic.dart';
import 'tixi_articles_state.dart';

class TixiArticlesLogic
    extends AbsListLogic<HomeArticleDatas, TixiArticlesState> {
  TixiArticlesLogic() : super(TixiArticlesState());

  @override
  Future<List<HomeArticleDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getArticles(
        page: pageIndex, pageSize: pageSize, cid: state.cid);
    return res.datas ?? List.empty();
  }
}

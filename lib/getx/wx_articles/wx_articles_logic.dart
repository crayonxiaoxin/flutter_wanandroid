import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';

import '../../net/dao/home_dao.dart';
import 'wx_articles_state.dart';

class WxArticlesLogic extends AbsListLogic<HomeArticleDatas, WxArticlesState> {
  WxArticlesLogic() : super(WxArticlesState());

  @override
  Future<List<HomeArticleDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getWxArticles(state.publicId,
        page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }
}

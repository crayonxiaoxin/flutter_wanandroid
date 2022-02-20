import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/query_dao.dart';

import 'query_state.dart';

class QueryLogic extends AbsListLogic<HomeArticleDatas, QueryState> {
  QueryLogic() : super(QueryState());

  @override
  Future<List<HomeArticleDatas>> getList(int pageIndex, int pageSize) async {
    var res = await QueryDao.query(
        page: pageIndex, pageSize: pageSize, keyword: state.keyword.value);
    return res.datas ?? List.empty();
  }

  submit() {
    String value = state.textEditingController.text;
    // MyRouterDelegate.of(context).push(MyRoutePath.query(), args: value,
    //     onPopResult: (res) {
    //       if (res == true) {
    //         _clear();
    //       }
    //     });
  }

  clear() {
    state.textEditingController.text = "";
  }
}

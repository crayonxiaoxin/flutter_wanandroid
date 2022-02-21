import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/query_dao.dart';
import 'package:get/get.dart';
import 'package:lx_base/utils/toast.dart';

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
    toast(S.of(Get.context!).searching(value));
    // Get.snackbar("請稍候", S.of(Get.context!).searching(value),
    //     duration: const Duration(seconds: 1),
    //     margin: EdgeInsets.all(16),
    //     snackPosition: SnackPosition.BOTTOM,
    //     snackStyle: SnackStyle.FLOATING);
    state.keyword.value = value;
    state.textEditingController.text = value;
    state.dataList.clear();
    onLoading(isLoadMore: false);
  }

  clear() {
    state.textEditingController.text = "";
    state.keyword.value = "";
    Get.back(result: true);
  }
}

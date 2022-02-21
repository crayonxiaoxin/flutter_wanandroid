import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/getx/routes.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';
import 'package:flutter_wan_android/net/dao/query_dao.dart';
import 'package:get/get.dart';

import 'hot_key_state.dart';

class HotKeyLogic extends AbsListLogic<HotkeyData, HotKeyState> {
  HotKeyLogic() : super(HotKeyState());

  @override
  Future<List<HotkeyData>> getList(int pageIndex, int pageSize) async {
    var res = await QueryDao.hotKey();
    return res.data ?? List.empty();
  }

  submit() async {
    String value = state.textEditingController.text;
    state.keyword.value = value;
    var res = await Get.toNamed(Routes.Query, arguments: {"keyword": value});
    if (res == true) {
      clear();
    }
  }

  clear() {
    state.keyword.value = "";
    state.textEditingController.text = "";
  }
}

import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';
import 'package:flutter_wan_android/net/dao/query_dao.dart';

import 'hot_key_state.dart';

class HotKeyLogic extends AbsListLogic<HotkeyData, HotKeyState> {
  HotKeyLogic() : super(HotKeyState());

  @override
  Future<List<HotkeyData>> getList(int pageIndex, int pageSize) async {
    var res = await QueryDao.hotKey();
    return res.data ?? List.empty();
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

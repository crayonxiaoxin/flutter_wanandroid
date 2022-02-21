import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HotKeyState extends AbsListState<HotkeyData> {
  late RxString keyword;
  final TextEditingController textEditingController = TextEditingController();

  HotKeyState() {
    keyword = "".obs;
    textEditingController.text = keyword.value;
  }

  @override
  bool get enablePullUp => false;
}

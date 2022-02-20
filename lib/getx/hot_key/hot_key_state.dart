import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';

class HotKeyState extends AbsListState<HotkeyData> {
  @override
  bool get enablePullUp => false;

  final TextEditingController textEditingController = TextEditingController();
}

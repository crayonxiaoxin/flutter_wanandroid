import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/logger.dart';
import 'package:get/get.dart';

import 'abs_list_state.dart';

abstract class AbsListLogic<Model, State extends AbsListState>
    extends GetxController {
  final State state;

  AbsListLogic(this.state);

  @mustCallSuper
  void onLoading(
      {bool isLoadMore = true,
      VoidCallback? onComplete,
      VoidCallback? onFailed,
      VoidCallback? onNoData}) async {
    if (!isLoadMore) {
      state.dataList.clear();
      state.currentPage.value = 1;
      state.isLoadAll.value = false;
    }
    if (state.isLoadAll.value) return;
    try {
      var list = await getList(state.currentPage.value, state.pageSize);
      if (state.currentPage.value == 1) {
        if (state.isLoadInitClear) {
          state.dataList.clear();
        }
      }
      // state.dataList.addAll(list);
      state.dataList.value += list;
      logger.e("222 ${state.runtimeType} ${state.dataList} ${list.length}");
      if (list.isEmpty) {
        state.isLoadAll.value = true;
        onNoData?.call();
      } else if (list.length < state.pageSize / 2) {
        // 当前数据少于半页时，认为没有更多数据了
        onNoData?.call();
      } else {
        state.currentPage++;
        onComplete?.call();
      }
    } catch (e) {
      print("load error => $e");
      onFailed?.call();
    }
  }

  Future<List<Model>> getList(int pageIndex, int pageSize);
}

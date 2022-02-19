import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'abs_list_state.dart';

abstract class AbsListLogic<Model, State extends AbsListState>
    extends GetxController {
  State get state;

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
      onComplete?.call();
      if (state.currentPage.value == 1) {
        if (!state.isLoadInitClear) {
          state.dataList.addAll(list);
        } else {
          state.dataList.value = list;
        }
      } else {
        state.dataList.addAll(list);
      }
      if (list.isEmpty) {
        state.isLoadAll.value = true;
        onNoData?.call();
      } else if (list.length < state.pageSize / 2) {
        // 当前数据少于半页时，认为没有更多数据了
        onNoData?.call();
      } else {
        state.currentPage++;
      }
    } catch (e) {
      print("load error => $e");
      onFailed?.call();
    }
  }

  Future<List<Model>> getList(int pageIndex, int pageSize);
}

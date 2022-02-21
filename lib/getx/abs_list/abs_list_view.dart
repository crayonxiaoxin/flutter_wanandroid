import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'abs_list_logic.dart';

abstract class AbsListPage<Logic extends AbsListLogic> extends StatelessWidget {
  const AbsListPage({Key? key, required this.logic}) : super(key: key);

  final Logic logic;

  get state => logic.state;

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.put<Logic>();
    // final AbsListState state = Get.find<Logic>().state;
    var widget = Obx(() {
      return SmartRefresher(
        controller: state.refreshController,
        onLoading: () => onLoading(),
        onRefresh: () {
          onLoading(isLoadMore: false);
        },
        header: const WaterDropMaterialHeader(
          color: Colors.white,
          backgroundColor: Colors.blue,
          distance: 100,
        ),
        footer: ClassicFooter(
          loadingText: S.of(context).loading,
          canLoadingText: S.of(context).load_more,
          failedText: S.of(context).load_failed,
          idleText: S.of(context).load_complete,
          noDataText: S.of(context).load_no_data,
        ),
        enablePullUp: state.enablePullUp,
        child: buildChild(context),
      );
    });
    var realAppBar = buildAppBar(context);
    return realAppBar != null
        ? Scaffold(
            appBar: realAppBar,
            extendBodyBehindAppBar: state.extendBodyBehindAppBar,
            body: widget,
          )
        : widget;
  }

  void onLoading({bool isLoadMore = true}) async {
    logic.onLoading(
        isLoadMore: isLoadMore,
        onComplete: () {
          state.refreshController.loadComplete();
          state.refreshController.refreshCompleted();
        },
        onFailed: () {
          state.refreshController.loadFailed();
          state.refreshController.refreshFailed();
        },
        onNoData: () {
          state.refreshController.loadNoData();
          state.refreshController.refreshCompleted();
        });
  }
}

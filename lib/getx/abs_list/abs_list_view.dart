import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'abs_list_logic.dart';

abstract class AbsListPage<Logic extends AbsListLogic> extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  AbsListPage({Key? key}) : super(key: key);

  Logic get logic;

  get state => logic.state;

  // 使用这个可以使用 setState
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.put<Logic>(logic());
    // final AbsListState state = Get.find<Logic>().state;
    var widget = Obx(() {
      return SmartRefresher(
        controller: _refreshController,
        onLoading: onLoading,
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
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        },
        onFailed: () {
          _refreshController.loadFailed();
          _refreshController.refreshFailed();
        },
        onNoData: () {
          _refreshController.loadNoData();
        });
  }
}

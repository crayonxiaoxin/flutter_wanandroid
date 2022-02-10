import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:lx_base/lx_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 抽象列表类
abstract class LxListState<Model, Entity, T extends StatefulWidget>
    extends LxState<T> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  List<Model> dataList = [];
  int _currentPage = 1;

  // 每页数量
  get pageSize => 20;

  Widget get child;

  get extendBodyBehindAppBar => false;

  // 是否允许加载更多
  get enablePullUp => true;

  // 使用这个不能使用 setState
  PreferredSizeWidget? get appBar => null;

  // 使用这个可以使用 setState
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  // 刷新时，是否清空初始数据
  bool get isLoadInitClear => true;

  // 是否加载完成
  bool isLoadAll = false;

  @override
  void initState() {
    super.initState();
    // 设置了 RefreshController(initialRefresh: true) 就不用在初始化手动加载了
    // onLoading(isLoadMore: false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var widget = SmartRefresher(
      controller: _refreshController,
      onLoading: onLoading,
      onRefresh: () {
        dataList.clear();
        onLoading(isLoadMore: false);
      },
      header: const WaterDropMaterialHeader(
        color: Colors.white,
        backgroundColor: Colors.blue,
        distance: 100,
      ),
      footer: ClassicFooter(
        loadingText: S.current.loading,
        canLoadingText: S.current.load_more,
        failedText: S.current.load_failed,
        idleText: S.current.load_complete,
        noDataText: S.current.load_no_data,
      ),
      enablePullUp: enablePullUp,
      child: child,
    );
    var realAppBar = buildAppBar(context) ?? appBar;
    return realAppBar != null
        ? Scaffold(
            appBar: realAppBar,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            body: widget,
          )
        : widget;
  }

  void onLoading({bool isLoadMore = true}) async {
    if (!isLoadMore) {
      _currentPage = 1;
      isLoadAll = false;
    }
    if (isLoadAll) return;
    try {
      var res = await getData(_currentPage, pageSize);
      var list = parseList(res);
      _refreshController.loadComplete();
      _refreshController.refreshCompleted();
      setState(() {
        if (_currentPage == 1) {
          if (!isLoadInitClear) {
            dataList.addAll(list);
          } else {
            dataList = list;
          }
        } else {
          dataList.addAll(list);
        }
      });
      if (list.isEmpty) {
        isLoadAll = true;
        _refreshController.loadNoData();
      } else if (list.length < pageSize) {
        _refreshController.loadNoData();
      } else {
        _currentPage++;
      }
    } catch (e) {
      _refreshController.loadFailed();
      _refreshController.refreshFailed();
      print(e);
    }
  }

  Future<Entity> getData(int pageIndex, int pageSize);

  List<Model> parseList(Entity res);
}

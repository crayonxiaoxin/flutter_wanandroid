import 'package:flutter/material.dart';
import 'package:lx_base/lx_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 抽象列表类
abstract class LxListState<Model, Entity, T extends StatefulWidget>
    extends LxState<T> {
  final RefreshController _refreshController = RefreshController();
  List<Model> dataList = [];
  int _currentPage = 1;

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

  @override
  void initState() {
    super.initState();
    onLoading(isLoadMore: false);
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
      footer: const ClassicFooter(),
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
    }
    try {
      // var res = await HomeDao.getArticles(page: _currentPage);
      // var list = res.datas ?? List.empty();
      var res = await getData(_currentPage);
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
      _currentPage++;
    } catch (e) {
      _refreshController.loadFailed();
      _refreshController.refreshFailed();
      print(e);
    }
  }

  Future<Entity> getData(int pageIndex);

  List<Model> parseList(Entity res);
}

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

  PreferredSizeWidget? get appBar => null;

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
        distance: 100,
      ),
      footer: const ClassicFooter(),
      enablePullUp: true,
      child: child,
    );
    return appBar != null
        ? Scaffold(
            appBar: appBar,
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

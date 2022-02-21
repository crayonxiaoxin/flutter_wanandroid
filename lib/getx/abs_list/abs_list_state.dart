import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AbsListState<Model> {
  late RxList<Model> dataList;
  late RxInt currentPage;

  /// 是否加载完成
  late RxBool isLoadAll;

  late RefreshController refreshController;

  AbsListState() {
    refreshController = RefreshController(initialRefresh: true);
    dataList = <Model>[].obs;
    currentPage = 1.obs;
    isLoadAll = false.obs;
  }

  /// 每页数量
  int get pageSize => 20;

  /// 是否可以被状态栏覆盖
  bool get extendBodyBehindAppBar => false;

  /// 是否允许加载更多
  bool get enablePullUp => true;

  /// 刷新时，是否清空初始数据
  bool get isLoadInitClear => true;
}

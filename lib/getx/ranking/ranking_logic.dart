import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/rank_entity.dart';

import '../../net/dao/home_dao.dart';
import '../../net/dao/login_dao.dart';
import 'ranking_state.dart';

class RankingLogic extends AbsListLogic<RankDatas, RankingState> {
  RankingLogic() : super(RankingState());

  @override
  Future<List<RankDatas>> getList(int pageIndex, int pageSize) async {
    var res = await HomeDao.getRankList(page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }

  @override
  void onLoading(
      {bool isLoadMore = true,
      VoidCallback? onComplete,
      VoidCallback? onFailed,
      VoidCallback? onNoData}) async {
    if (!isLoadMore) {
      state.rankCount.value = int.parse(LoginDao.coinInfo()?.rank ?? "0");
      state.coinCount.value = LoginDao.coinInfo()?.coinCount ?? 0;
      loadCoinInfo();
    }
    super.onLoading(
        isLoadMore: isLoadMore,
        onComplete: onComplete,
        onFailed: onFailed,
        onNoData: onNoData);
  }

  loadCoinInfo() async {
    var response = await LoginDao.getCoinCount();
    if (response.data != null) {
      state.rankCount.value = int.parse(response.data?.rank ?? "0");
      state.coinCount.value = response.data?.coinCount ?? 0;
    }
  }
}

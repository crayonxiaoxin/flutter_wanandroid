import 'package:flutter/material.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_logic.dart';
import 'package:flutter_wan_android/model/coin_list_entity.dart';

import '../../net/dao/login_dao.dart';
import 'coin_state.dart';

class CoinLogic extends AbsListLogic<CoinListDatas, CoinState> {
  CoinLogic() : super(CoinState());

  @override
  Future<List<CoinListDatas>> getList(int pageIndex, int pageSize) async {
    var res = await LoginDao.getCoinList(page: pageIndex, pageSize: pageSize);
    return res.datas ?? List.empty();
  }

  @override
  void onLoading(
      {bool isLoadMore = true,
      VoidCallback? onComplete,
      VoidCallback? onFailed,
      VoidCallback? onNoData}) async {
    if (!isLoadMore) {
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
      state.coinCount.value = response.data?.coinCount ?? 0;
    }
  }
}

import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:get/get.dart';

import '../../model/coin_list_entity.dart';

class CoinState extends AbsListState<CoinListDatas> {
  late RxInt coinCount;

  CoinState() {
    coinCount = 0.obs;
  }
}

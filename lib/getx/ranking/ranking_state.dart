import 'package:flutter_wan_android/getx/abs_list/abs_list_state.dart';
import 'package:get/get.dart';

import '../../model/rank_entity.dart';

class RankingState extends AbsListState<RankDatas> {
  late RxInt rankCount;
  late RxInt coinCount;

  RankingState() {
    rankCount = 0.obs;
    coinCount = 0.obs;
  }
}

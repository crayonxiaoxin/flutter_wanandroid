import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/model/coin_list_entity.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/animate_int.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState
    extends LxListState<CoinListDatas, CoinListEntity, CoinPage> {
  int _coinCount = 0;

  @override
  void onLoading({bool isLoadMore = true}) {
    if (!isLoadMore) {
      setState(() {
        _coinCount = LoginDao.coinInfo()?.coinCount ?? 0;
      });
      _loadCoinInfo();
    }
    super.onLoading(isLoadMore: isLoadMore);
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2,
      height: 160,
      child: Stack(
        children: [
          SizedBox(
            height: 46,
            child: Stack(
              children: [
                const Positioned(
                  child: BackButton(color: Colors.white),
                  left: 0,
                  top: 0,
                  bottom: 0,
                ),
                Center(
                  child: Text(
                    S.of(context).profile_coin,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  child: IconButton(
                      icon: const Icon(Icons.query_stats_outlined),
                      color: Colors.white,
                      onPressed: () {
                        MyRouterDelegate.of(context)
                            .push(MyRoutePath.rankList());
                      }),
                  right: 0,
                  top: 0,
                  bottom: 0,
                ),
              ],
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: AnimatedCount(
              value: _coinCount,
              duration: const Duration(milliseconds: 500),
              style: TextStyle(fontSize: 40, color: Colors.white, shadows: [
                Shadow(
                    color: Colors.grey.shade700,
                    blurRadius: 3,
                    offset: const Offset(2, 2))
              ]),
            ),
          )),
        ],
      ),
    );
  }

  @override
  Widget get child => ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return _item(dataList[index]);
      });

  @override
  Future<CoinListEntity> getData(int pageIndex, int pageSize) {
    return LoginDao.getCoinList(page: pageIndex, pageSize: pageSize);
  }

  @override
  List<CoinListDatas> parseList(CoinListEntity res) {
    return res.datas ?? List.empty();
  }

  Widget _item(CoinListDatas item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.reason}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text("${item.desc}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ),
              ],
            ),
            Text("${(item.coinCount ?? 0) > 0 ? "+" : ""}${item.coinCount}",
                style: const TextStyle(fontSize: 14, color: Colors.blue))
          ],
        ),
      ),
    );
  }

  void _loadCoinInfo() async {
    var response = await LoginDao.getCoinCount();
    if (response.data != null) {
      setState(() {
        _coinCount = response.data?.coinCount ?? 0;
      });
    }
  }
}

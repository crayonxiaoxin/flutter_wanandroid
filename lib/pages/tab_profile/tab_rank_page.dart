import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/model/rank_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/animate_int.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../widgets/url_utils.dart';

class RankPage extends StatefulWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends LxListState<RankDatas, RankEntity, RankPage> {
  int _rankCount = 0;
  int _coinCount = 0;

  @override
  void onLoading({bool isLoadMore = true}) {
    if (!isLoadMore) {
      setState(() {
        _rankCount = int.parse(LoginDao.coinInfo()?.rank ?? "0");
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
      height: 168,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    S.of(context).profile_rank,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.help_outline),
                      onPressed: () {
                        launchUrl(context,
                            "https://www.wanandroid.com/blog/show/2653",
                            title: "积分规则");
                      }),
                  right: 0,
                  top: 0,
                  bottom: 0,
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedCount(
                value: _rankCount,
                duration: const Duration(milliseconds: 500),
                style: TextStyle(fontSize: 40, color: Colors.white, shadows: [
                  Shadow(
                      color: Colors.grey.shade700,
                      blurRadius: 3,
                      offset: const Offset(2, 2))
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                  child: _item(
                      rank: _rankCount,
                      username: "${LoginDao.userInfo()?.username}",
                      coin: _coinCount,
                      coinColor: Colors.white,
                      background: Colors.white30)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          var item = dataList[index];
          return _item(
              rank: item.rank, username: item.username, coin: item.coinCount);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
              color: Colors.grey.shade200,
              height: 1,
              indent: 16,
              endIndent: 16);
        },
      );

  @override
  Future<RankEntity> getData(int pageIndex, int pageSize) {
    return HomeDao.getRankList(page: pageIndex, pageSize: pageSize);
  }

  @override
  List<RankDatas> parseList(RankEntity res) {
    return res.datas ?? List.empty();
  }

  Widget _item(
      {rank,
      username,
      coin,
      Color? coinColor = Colors.blue,
      Color? background}) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: background,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 8),
                  constraints: const BoxConstraints(minWidth: 50),
                  child: Text(
                    "$rank",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "$username",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Text("$coin",
                style: TextStyle(
                    fontSize: 16,
                    color: coinColor,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }

  void _loadCoinInfo() async {
    var response = await LoginDao.getCoinCount();
    if (response.data != null) {
      setState(() {
        _rankCount = int.parse(response.data?.rank ?? "0");
        _coinCount = response.data?.coinCount ?? 0;
      });
    }
  }
}

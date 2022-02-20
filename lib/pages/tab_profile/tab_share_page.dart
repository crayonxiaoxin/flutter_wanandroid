import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import '../../widgets/article_item_card.dart';

class ShareListPage extends StatefulWidget {
  const ShareListPage({Key? key}) : super(key: key);

  @override
  _ShareListPageState createState() => _ShareListPageState();
}

class _ShareListPageState
    extends LxListState<HomeArticleDatas, HomeArticleEntity, ShareListPage> {
  @override
  var appBar = ImmersiveAppBar(
    gradient: const LinearGradient(
      colors: [Colors.blueAccent, Colors.lightBlueAccent],
    ),
    elevation: 2,
    leading: const BackButton(color: Colors.white),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          Center(
            child: Text(
              S.current.profile_share,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget get child => ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ArticleItemCard(
          dataList[index],
          showDetail: true,
          onCollect: (collect) {
            dataList[index].collect = collect;
          },
        );
      });

  @override
  Future<HomeArticleEntity> getData(int pageIndex, int pageSize) {
    return HomeDao.getPrivateShareArticles(page: pageIndex, pageSize: pageSize);
  }

  @override
  List<HomeArticleDatas> parseList(HomeArticleEntity res) {
    return res.datas ?? List.empty();
  }
}

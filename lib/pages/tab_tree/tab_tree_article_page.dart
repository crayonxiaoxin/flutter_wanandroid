import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/article_item_card.dart';

class TabTreeArticlePage extends StatefulWidget {
  final int cid;

  const TabTreeArticlePage({Key? key, required this.cid}) : super(key: key);

  @override
  _TabTreeArticlePageState createState() => _TabTreeArticlePageState();
}

class _TabTreeArticlePageState extends LxListState<HomeArticleDatas,
    HomeArticleEntity, TabTreeArticlePage> {
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
    return HomeDao.getArticles(
        page: pageIndex, pageSize: pageSize, cid: widget.cid);
  }

  @override
  List<HomeArticleDatas> parseList(HomeArticleEntity res) {
    return res.datas ?? List.empty();
  }
}

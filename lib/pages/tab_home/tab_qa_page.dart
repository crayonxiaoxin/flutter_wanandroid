import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/article_item_card.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class TabQaPage extends StatefulWidget {
  const TabQaPage({Key? key}) : super(key: key);

  @override
  _TabQaPageState createState() => _TabQaPageState();
}

class _TabQaPageState
    extends LxListState<HomeArticleDatas, HomeArticleEntity, TabQaPage> {
  @override
  var appBar = ImmersiveAppBar(
    gradient: const LinearGradient(
      colors: [Colors.lightBlueAccent, Colors.blueAccent],
    ),
    elevation: 2,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: const [
          Center(
            child: Text(
              "问答",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        );
      });

  @override
  Future<HomeArticleEntity> getData(int pageIndex) {
    return HomeDao.getQAs(page: pageIndex);
  }

  @override
  List<HomeArticleDatas> parseList(HomeArticleEntity res) {
    return res.datas ?? List.empty();
  }
}

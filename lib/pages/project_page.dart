import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/project_item_card.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class ProjectPage extends StatefulWidget {
  final int projectId;
  final String projectName;

  const ProjectPage(
      {Key? key, required this.projectId, required this.projectName})
      : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState
    extends LxListState<HomeArticleDatas, HomeArticleEntity, ProjectPage> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
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
                widget.projectName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ProjectItemCard(
          dataList[index],
          showDetail: true,
          onCollect: (collect) {
            dataList[index].collect = collect;
          },
        );
      });

  @override
  Future<HomeArticleEntity> getData(int pageIndex, int pageSize) {
    return HomeDao.getProjects(widget.projectId,
        page: pageIndex, pageSize: pageSize);
  }

  @override
  List<HomeArticleDatas> parseList(HomeArticleEntity res) {
    return res.datas ?? List.empty();
  }
}

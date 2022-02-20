import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/model/collect_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/collect_item_card.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class CollectListPage extends StatefulWidget {
  const CollectListPage({Key? key}) : super(key: key);

  @override
  _CollectListPageState createState() => _CollectListPageState();
}

class _CollectListPageState
    extends LxListState<CollectDatas, CollectEntity, CollectListPage> {
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
              S.current.profile_favorite,
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
        return CollectItemCard(
          dataList[index],
          showDetail: true,
          onCollect: (collect) {
            dataList.removeAt(index);
            setState(() {
              dataList = dataList;
            });
          },
        );
      });

  @override
  Future<CollectEntity> getData(int pageIndex, int pageSize) {
    return HomeDao.getCollectList(page: pageIndex, pageSize: pageSize);
  }

  @override
  List<CollectDatas> parseList(CollectEntity res) {
    return res.datas ?? List.empty();
  }
}

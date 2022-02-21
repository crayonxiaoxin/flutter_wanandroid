import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/widgets/article_item_card.dart';
import 'package:flutter_wan_android/widgets/search_box.dart';
import 'package:get/get.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import 'query_logic.dart';

class QueryPage extends AbsListPage<QueryLogic> {
  QueryPage({Key? key}) : super(key: key, logic: QueryLogic());

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      elevation: 2,
      leading: const BackButton(color: Colors.white),
      builder: (context) {
        return Container(
            margin: const EdgeInsets.only(left: 60, right: 8),
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(child: _buildSearchBox(context)),
                IconButton(
                  onPressed: () => logic.submit(),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ));
      },
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: state.dataList.length,
        itemBuilder: (context, index) {
          return ArticleItemCard(
            state.dataList[index],
            showDetail: true,
            onCollect: (collect) {
              state.dataList[index].collect = collect;
            },
          );
        });
  }

  _buildSearchBox(BuildContext context) {
    return Obx(() {
      return SearchBox(
        hintText: S.of(context).search_box_hint,
        textEditingController: state.textEditingController,
        showClearIcon: state.keyword.value.isNotEmpty,
        onSubmitted: (value) {
          logic.submit();
        },
        onChanged: (value) {
          state.keyword.value = value;
        },
        onClear: () => logic.clear(),
      );
    });
  }
}

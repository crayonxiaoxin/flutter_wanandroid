import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/abs_list/abs_list_view.dart';
import 'package:flutter_wan_android/widgets/search_box.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

import 'hot_key_logic.dart';

class HotKeyPage extends AbsListPage<HotKeyLogic> {
  HotKeyPage({Key? key}) : super(key: key, logic: HotKeyLogic());

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
                Expanded(
                  child: _buildSearchBox(context),
                ),
                IconButton(
                  onPressed: () {
                    logic.submit();
                  },
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
    return ListView(
      children: [
        TagGroup(S.of(context).hot_keys, children: [
          ...state.dataList.map((e) => TagGroupItem(
                e.name,
                onPressed: () {
                  state.textEditingController.text = "${e.name}";
                  logic.submit();
                },
              ))
        ])
      ],
    );
  }

  _buildSearchBox(BuildContext context) {
    return SearchBox(
      hintText: S.of(context).search_box_hint,
      textEditingController: state.textEditingController,
      autofocus: true,
      onSubmitted: (value) {
        logic.submit();
      },
      onChanged: (value) {
        // setState(() {});
      },
      onClear: () {
        logic.clear();
      },
    );
  }
}

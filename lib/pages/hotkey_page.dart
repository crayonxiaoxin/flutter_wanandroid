import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';
import 'package:flutter_wan_android/net/dao/query_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/search_box.dart';
import 'package:flutter_wan_android/widgets/tag_group.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class HotkeyPage extends StatefulWidget {
  const HotkeyPage({Key? key}) : super(key: key);

  @override
  _HotkeyPageState createState() => _HotkeyPageState();
}

class _HotkeyPageState
    extends LxListState<HotkeyData, HotkeyEntity, HotkeyPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return ImmersiveAppBar(
      gradient: const LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.blueAccent],
      ),
      elevation: 2,
      leading: const BackButton(),
      builder: (context) {
        return Container(
            margin: const EdgeInsets.only(left: 60, right: 16),
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: _buildSearchBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap: _submit,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  _buildSearchBox() {
    return SearchBox(
      textEditingController: _textEditingController,
      autofocus: true,
      onSubmitted: (value) {
        _submit();
      },
      onChanged: (value) {
        setState(() {});
      },
      onClear: _clear,
    );
  }

  void _clear() {
    setState(() {
      _textEditingController.text = "";
    });
  }

  @override
  Widget get child => ListView(
        children: [
          TagGroup("热门搜索", children: [
            ...dataList.map((e) => TagGroupItem(
                  e.name,
                  onPressed: () {
                    setState(() {
                      _textEditingController.text = "${e.name}";
                    });
                    _submit();
                  },
                ))
          ])
        ],
      );

  @override
  get enablePullUp => false;

  @override
  Future<HotkeyEntity> getData(int pageIndex, int pageSize) {
    return QueryDao.hotKey();
  }

  @override
  List<HotkeyData> parseList(HotkeyEntity res) {
    return res.data ?? List.empty();
  }

  void _submit() {
    String value = _textEditingController.text;
    MyRouterDelegate.of(context).push(MyRoutePath.query(), args: value,
        onPopResult: (res) {
      if (res == true) {
        _clear();
      }
    });
  }
}

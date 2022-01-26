import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/query_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:flutter_wan_android/utils/lx_list_state.dart';
import 'package:flutter_wan_android/widgets/article_item_card.dart';
import 'package:flutter_wan_android/widgets/search_box.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/immersive_app_bar.dart';

class QueryPage extends StatefulWidget {
  final String? initKeyword;

  const QueryPage({Key? key, required this.initKeyword}) : super(key: key);

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState
    extends LxListState<HomeArticleDatas, HomeArticleEntity, QueryPage> {
  String keyword = "";
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController.text = widget.initKeyword ?? "";
    keyword = _textEditingController.text;
    super.initState();
  }

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
                Expanded(child: _buildSearchBox()),
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

  final OutlineInputBorder _border = const OutlineInputBorder(
      gapPadding: 0, borderSide: BorderSide(color: Colors.transparent));

  _buildSearchBox() {
    return SearchBox(
      textEditingController: _textEditingController,
      onSubmitted: (value) {
        _submit();
      },
      onChanged: (value) {
        setState(() {});
      },
      onClear: _clear,
    );
  }

  void _submit() {
    var value = _textEditingController.text;
    toast("正在搜索: $value");
    setState(() {
      dataList.clear();
      keyword = value;
    });
    onLoading(isLoadMore: false);
  }

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
    return QueryDao.query(
        page: pageIndex, pageSize: pageSize, keyword: keyword);
  }

  @override
  List<HomeArticleDatas> parseList(HomeArticleEntity res) {
    return res.datas ?? List.empty();
  }

  void _clear() {
    setState(() {
      _textEditingController.text = "";
    });
    MyRouterDelegate.of(context).pop(result: true);
  }
}

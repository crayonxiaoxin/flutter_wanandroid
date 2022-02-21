import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/collect_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:lx_base/utils/html_utils.dart';
import 'package:lx_base/utils/string_utils.dart';
import 'package:lx_base/utils/toast.dart';

class CollectItemCard extends StatefulWidget {
  final CollectDatas item;
  final bool showDetail;
  final ValueChanged<bool>? onCollect;

  const CollectItemCard(
    this.item, {
    Key? key,
    this.showDetail = false,
    this.onCollect,
  }) : super(key: key);

  @override
  State<CollectItemCard> createState() => _CollectItemCardState();
}

class _CollectItemCardState extends State<CollectItemCard> {
  bool isCollected = true;

  @override
  void initState() {
    super.initState();
    isCollected = true;
  }

  @override
  Widget build(BuildContext context) {
    return _articleItem(context);
  }

  Widget _articleItem(BuildContext context) {
    // var themeProvider = context.watch<ThemeProvider>();
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Material(
        // color: themeProvider.isDarkMode() ? null : Colors.white,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.grey[50],
        elevation: 0.2,
        borderOnForeground: false,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            _handleItemClick(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _articleItemTop(),
                _articleItemCenter(),
                _articleItemBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _articleItemCenter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(parseHtml(widget.item.title),
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          if (widget.showDetail && isNotEmpty(widget.item.desc))
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Text(parseHtml(widget.item.desc),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  )),
            ),
        ],
      ),
    );
  }

  Row _articleItemBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "${widget.item.chapterName}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
        InkWell(
          onTap: () {
            _favorite(widget.item);
          },
          child: isCollected
              ? const Icon(Icons.favorite, color: Colors.redAccent)
              : const Icon(Icons.favorite_border, color: Colors.grey),
        )
      ],
    );
  }

  Row _articleItemTop() {
    var username = widget.item.author ?? "";
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  username,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Text("${widget.item.niceDate}",
            style: const TextStyle(fontSize: 12, color: Colors.grey))
      ],
    );
  }

  void _favorite(CollectDatas item) async {
    if (isCollected) {
      var response = await HomeDao.unCollectArticle(item.id,
          originId: item.originId ?? -1);
      toast(response ? "取消收藏成功！" : "取消收藏失败！");
    }
    widget.onCollect?.call(isCollected);
  }

  void _handleItemClick(BuildContext context) {
    launchUrl(context, widget.item.link, title: widget.item.title);
  }
}

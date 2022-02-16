import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/net/dao/home_dao.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:lx_base/utils/html_utils.dart';
import 'package:lx_base/utils/string_utils.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_base/widget/adaptive_container.dart';
import 'package:lx_base/widget/cached_image.dart';
import 'package:provider/src/provider.dart';

class ProjectItemCard extends StatefulWidget {
  final HomeArticleDatas item;
  final bool showDetail;
  final ValueChanged<bool>? onCollect;

  const ProjectItemCard(
    this.item, {
    Key? key,
    this.showDetail = false,
    this.onCollect,
  }) : super(key: key);

  @override
  State<ProjectItemCard> createState() => _ProjectItemCardState();
}

class _ProjectItemCardState extends State<ProjectItemCard> {
  bool isCollected = false;

  @override
  void initState() {
    super.initState();
    isCollected = widget.item.collect ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return _articleItem(context);
  }

  Widget _articleItem(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 0),
      child: Material(
        color: themeProvider.isDarkMode() ? null : Colors.white,
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
            child: _articleItemCenter(),
          ),
        ),
      ),
    );
  }

  Padding _articleItemCenter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 120,
              child: AdaptiveContainer(
                  aspectRatio: 9 / 16,
                  child: CachedImage(widget.item.envelopePic))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              height: 120 / (9 / 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(parseHtml(widget.item.title),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      if (widget.showDetail && isNotEmpty(widget.item.desc))
                        Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(parseHtml(widget.item.desc),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              )),
                        ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [..._articleItemTop()],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _articleItemTop() {
    var username;
    var niceDate;
    if (widget.item.author != null && widget.item.author!.isNotEmpty) {
      username = widget.item.author;
      niceDate = widget.item.niceDate;
    } else {
      username = widget.item.shareUser;
      niceDate = widget.item.niceShareDate;
    }
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8),
            child: Text(
              "$username",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          ..._articleTags(widget.item.tags)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$niceDate",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          InkWell(
            onTap: () {
              _favorite(widget.item);
            },
            child: isCollected
                ? const Icon(Icons.favorite, color: Colors.redAccent)
                : const Icon(Icons.favorite_border, color: Colors.grey),
          )
        ],
      ),
    ];
  }

  _articleTags(List<HomeArticleDatasTags>? tags) {
    if (tags == null) return [];
    return tags.map((e) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blue)),
        child: Text(
          "${e.name}",
          style: const TextStyle(fontSize: 12, color: Colors.blue),
        ),
      );
    }).toList();
  }

  void _favorite(HomeArticleDatas item) async {
    if (isCollected) {
      var response = await HomeDao.unCollectArticle(item.id);
      toast(response ? "取消收藏成功！" : "取消收藏失败！");
      if (response) {
        setState(() {
          isCollected = false;
        });
      }
    } else {
      var response = await HomeDao.collectArticle(item.id);
      toast(response ? "收藏成功！" : "收藏失败！");
      if (response) {
        setState(() {
          isCollected = true;
        });
      }
    }
    widget.onCollect?.call(isCollected);
  }

  void _handleItemClick(BuildContext context) {
    launchUrl(context, widget.item.link, title: widget.item.title);
  }
}

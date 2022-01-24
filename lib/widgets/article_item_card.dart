import 'package:flutter/material.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/widgets/url_utils.dart';
import 'package:lx_base/utils/html_utils.dart';
import 'package:lx_base/utils/string_utils.dart';
import 'package:lx_base/utils/toast.dart';

class ArticleItemCard extends StatelessWidget {
  final HomeArticleDatas item;
  final bool showDetail;

  const ArticleItemCard(
    this.item, {
    Key? key,
    this.showDetail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _articleItem(context);
  }

  Widget _articleItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Material(
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
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[100]!, blurRadius: 5.0, spreadRadius: 2.0)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          _handleItemClick(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _articleItemTop(),
            _articleItemCenter(),
            _articleItemBottom()
          ],
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
          Text(parseHtml(item.title),
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          if (showDetail && isNotEmpty(item.desc))
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Text(parseHtml(item.desc),
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
            if (item.type == 1)
              const Text(
                "置顶  ",
                style: TextStyle(fontSize: 12, color: Colors.orangeAccent),
              ),
            Text(
              "${item.superChapterName} · ${item.chapterName}",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
        InkWell(
          onTap: () {
            _favorite(item);
          },
          child: item.collect == true
              ? const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
        )
      ],
    );
  }

  Row _articleItemTop() {
    var username = (item.author != null && item.author!.isNotEmpty)
        ? item.author
        : item.shareUser;
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "$username",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              ..._articleTags(item.tags)
            ],
          ),
        ),
        Text("${item.niceShareDate}",
            style: const TextStyle(fontSize: 12, color: Colors.grey))
      ],
    );
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

  void _favorite(HomeArticleDatas item) {
    toast("favorite: ${item.title}");
  }

  void _handleItemClick(BuildContext context) {
    launchUrl(context, item.link, title: item.title);
  }
}

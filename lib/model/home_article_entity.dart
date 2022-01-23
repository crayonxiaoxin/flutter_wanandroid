import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/home_article_entity.g.dart';

@JsonSerializable()
class HomeArticleEntity {
  int? curPage;
  List<HomeArticleDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  HomeArticleEntity();

  factory HomeArticleEntity.fromJson(Map<String, dynamic> json) =>
      $HomeArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeArticleDatas {
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<HomeArticleDatasTags>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  HomeArticleDatas();

  factory HomeArticleDatas.fromJson(Map<String, dynamic> json) =>
      $HomeArticleDatasFromJson(json);

  Map<String, dynamic> toJson() => $HomeArticleDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeArticleDatasTags {
  String? name;
  String? url;

  HomeArticleDatasTags();

  factory HomeArticleDatasTags.fromJson(Map<String, dynamic> json) =>
      $HomeArticleDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => $HomeArticleDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

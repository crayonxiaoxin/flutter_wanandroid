import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';

HomeArticleEntity $HomeArticleEntityFromJson(Map<String, dynamic> json) {
  final HomeArticleEntity homeArticleEntity = HomeArticleEntity();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    homeArticleEntity.curPage = curPage;
  }
  final List<HomeArticleDatas>? datas =
      jsonConvert.convertListNotNull<HomeArticleDatas>(json['datas']);
  if (datas != null) {
    homeArticleEntity.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    homeArticleEntity.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    homeArticleEntity.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    homeArticleEntity.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    homeArticleEntity.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    homeArticleEntity.total = total;
  }
  return homeArticleEntity;
}

Map<String, dynamic> $HomeArticleEntityToJson(HomeArticleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['curPage'] = entity.curPage;
  data['datas'] = entity.datas?.map((v) => v.toJson()).toList();
  data['offset'] = entity.offset;
  data['over'] = entity.over;
  data['pageCount'] = entity.pageCount;
  data['size'] = entity.size;
  data['total'] = entity.total;
  return data;
}

HomeArticleDatas $HomeArticleDatasFromJson(Map<String, dynamic> json) {
  final HomeArticleDatas homeArticleDatas = HomeArticleDatas();
  final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
  if (apkLink != null) {
    homeArticleDatas.apkLink = apkLink;
  }
  final int? audit = jsonConvert.convert<int>(json['audit']);
  if (audit != null) {
    homeArticleDatas.audit = audit;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    homeArticleDatas.author = author;
  }
  final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
  if (canEdit != null) {
    homeArticleDatas.canEdit = canEdit;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    homeArticleDatas.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    homeArticleDatas.chapterName = chapterName;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    homeArticleDatas.collect = collect;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    homeArticleDatas.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    homeArticleDatas.desc = desc;
  }
  final String? descMd = jsonConvert.convert<String>(json['descMd']);
  if (descMd != null) {
    homeArticleDatas.descMd = descMd;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    homeArticleDatas.envelopePic = envelopePic;
  }
  final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
  if (fresh != null) {
    homeArticleDatas.fresh = fresh;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    homeArticleDatas.host = host;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeArticleDatas.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    homeArticleDatas.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    homeArticleDatas.niceDate = niceDate;
  }
  final String? niceShareDate =
      jsonConvert.convert<String>(json['niceShareDate']);
  if (niceShareDate != null) {
    homeArticleDatas.niceShareDate = niceShareDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    homeArticleDatas.origin = origin;
  }
  final String? prefix = jsonConvert.convert<String>(json['prefix']);
  if (prefix != null) {
    homeArticleDatas.prefix = prefix;
  }
  final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
  if (projectLink != null) {
    homeArticleDatas.projectLink = projectLink;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    homeArticleDatas.publishTime = publishTime;
  }
  final int? realSuperChapterId =
      jsonConvert.convert<int>(json['realSuperChapterId']);
  if (realSuperChapterId != null) {
    homeArticleDatas.realSuperChapterId = realSuperChapterId;
  }
  final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
  if (selfVisible != null) {
    homeArticleDatas.selfVisible = selfVisible;
  }
  final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
  if (shareDate != null) {
    homeArticleDatas.shareDate = shareDate;
  }
  final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
  if (shareUser != null) {
    homeArticleDatas.shareUser = shareUser;
  }
  final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
  if (superChapterId != null) {
    homeArticleDatas.superChapterId = superChapterId;
  }
  final String? superChapterName =
      jsonConvert.convert<String>(json['superChapterName']);
  if (superChapterName != null) {
    homeArticleDatas.superChapterName = superChapterName;
  }
  final List<HomeArticleDatasTags>? tags =
      jsonConvert.convertListNotNull<HomeArticleDatasTags>(json['tags']);
  if (tags != null) {
    homeArticleDatas.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    homeArticleDatas.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    homeArticleDatas.type = type;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    homeArticleDatas.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    homeArticleDatas.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    homeArticleDatas.zan = zan;
  }
  return homeArticleDatas;
}

Map<String, dynamic> $HomeArticleDatasToJson(HomeArticleDatas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['apkLink'] = entity.apkLink;
  data['audit'] = entity.audit;
  data['author'] = entity.author;
  data['canEdit'] = entity.canEdit;
  data['chapterId'] = entity.chapterId;
  data['chapterName'] = entity.chapterName;
  data['collect'] = entity.collect;
  data['courseId'] = entity.courseId;
  data['desc'] = entity.desc;
  data['descMd'] = entity.descMd;
  data['envelopePic'] = entity.envelopePic;
  data['fresh'] = entity.fresh;
  data['host'] = entity.host;
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['niceDate'] = entity.niceDate;
  data['niceShareDate'] = entity.niceShareDate;
  data['origin'] = entity.origin;
  data['prefix'] = entity.prefix;
  data['projectLink'] = entity.projectLink;
  data['publishTime'] = entity.publishTime;
  data['realSuperChapterId'] = entity.realSuperChapterId;
  data['selfVisible'] = entity.selfVisible;
  data['shareDate'] = entity.shareDate;
  data['shareUser'] = entity.shareUser;
  data['superChapterId'] = entity.superChapterId;
  data['superChapterName'] = entity.superChapterName;
  data['tags'] = entity.tags?.map((v) => v.toJson()).toList();
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  data['zan'] = entity.zan;
  return data;
}

HomeArticleDatasTags $HomeArticleDatasTagsFromJson(Map<String, dynamic> json) {
  final HomeArticleDatasTags homeArticleDatasTags = HomeArticleDatasTags();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    homeArticleDatasTags.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    homeArticleDatasTags.url = url;
  }
  return homeArticleDatasTags;
}

Map<String, dynamic> $HomeArticleDatasTagsToJson(HomeArticleDatasTags entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

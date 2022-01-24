import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/navi_entity.dart';

NaviEntity $NaviEntityFromJson(Map<String, dynamic> json) {
  final NaviEntity naviEntity = NaviEntity();
  final List<NaviData>? data =
      jsonConvert.convertListNotNull<NaviData>(json['data']);
  if (data != null) {
    naviEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    naviEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    naviEntity.errorMsg = errorMsg;
  }
  return naviEntity;
}

Map<String, dynamic> $NaviEntityToJson(NaviEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

NaviData $NaviDataFromJson(Map<String, dynamic> json) {
  final NaviData naviData = NaviData();
  final List<HomeArticleDatas>? articles =
      jsonConvert.convertListNotNull<HomeArticleDatas>(json['articles']);
  if (articles != null) {
    naviData.articles = articles;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    naviData.cid = cid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    naviData.name = name;
  }
  return naviData;
}

Map<String, dynamic> $NaviDataToJson(NaviData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['articles'] = entity.articles?.map((v) => v.toJson()).toList();
  data['cid'] = entity.cid;
  data['name'] = entity.name;
  return data;
}

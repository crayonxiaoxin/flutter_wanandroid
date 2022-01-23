import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/home_top_article_entity.dart';

HomeTopArticleEntity $HomeTopArticleEntityFromJson(Map<String, dynamic> json) {
  final HomeTopArticleEntity homeTopArticleEntity = HomeTopArticleEntity();
  final List<HomeArticleDatas>? data =
      jsonConvert.convertListNotNull<HomeArticleDatas>(json['data']);
  if (data != null) {
    homeTopArticleEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    homeTopArticleEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    homeTopArticleEntity.errorMsg = errorMsg;
  }
  return homeTopArticleEntity;
}

Map<String, dynamic> $HomeTopArticleEntityToJson(HomeTopArticleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/home_top_article_entity.g.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';

@JsonSerializable()
class HomeTopArticleEntity {
  List<HomeArticleDatas>? data;
  int? errorCode;
  String? errorMsg;

  HomeTopArticleEntity();

  factory HomeTopArticleEntity.fromJson(Map<String, dynamic> json) =>
      $HomeTopArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeTopArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

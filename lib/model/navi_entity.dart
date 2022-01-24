import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/navi_entity.g.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';

@JsonSerializable()
class NaviEntity {
  List<NaviData>? data;
  int? errorCode;
  String? errorMsg;

  NaviEntity();

  factory NaviEntity.fromJson(Map<String, dynamic> json) =>
      $NaviEntityFromJson(json);

  Map<String, dynamic> toJson() => $NaviEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NaviData {
  List<HomeArticleDatas>? articles;
  int? cid;
  String? name;

  NaviData();

  factory NaviData.fromJson(Map<String, dynamic> json) =>
      $NaviDataFromJson(json);

  Map<String, dynamic> toJson() => $NaviDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

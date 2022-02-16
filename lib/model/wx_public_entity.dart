import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/wx_public_entity.g.dart';

@JsonSerializable()
class WxPublicEntity {
  List<WxPublicData>? data;
  int? errorCode;
  String? errorMsg;

  WxPublicEntity();

  factory WxPublicEntity.fromJson(Map<String, dynamic> json) =>
      $WxPublicEntityFromJson(json);

  Map<String, dynamic> toJson() => $WxPublicEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WxPublicData {
  List<dynamic>? children;
  int? courseId;
  int? id;
  String? name;
  int? order;
  int? parentChapterId;
  bool? userControlSetTop;
  int? visible;

  WxPublicData();

  factory WxPublicData.fromJson(Map<String, dynamic> json) =>
      $WxPublicDataFromJson(json);

  Map<String, dynamic> toJson() => $WxPublicDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

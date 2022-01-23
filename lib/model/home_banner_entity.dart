import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/home_banner_entity.g.dart';

@JsonSerializable()
class HomeBannerEntity {
  List<HomeBannerData>? data;
  int? errorCode;
  String? errorMsg;

  HomeBannerEntity();

  factory HomeBannerEntity.fromJson(Map<String, dynamic> json) =>
      $HomeBannerEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeBannerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeBannerData {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  HomeBannerData();

  factory HomeBannerData.fromJson(Map<String, dynamic> json) =>
      $HomeBannerDataFromJson(json);

  Map<String, dynamic> toJson() => $HomeBannerDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

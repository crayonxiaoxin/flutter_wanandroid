import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/user_info_entity.g.dart';
import 'package:flutter_wan_android/model/login_entity.dart';

@JsonSerializable()
class UserInfoEntity {
  UserInfoData? data;
  int? errorCode;
  String? errorMsg;

  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoData {
  UserInfoDataCoinInfo? coinInfo;
  LoginData? userInfo;

  UserInfoData();

  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      $UserInfoDataFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoDataCoinInfo {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  UserInfoDataCoinInfo();

  factory UserInfoDataCoinInfo.fromJson(Map<String, dynamic> json) =>
      $UserInfoDataCoinInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataCoinInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  static UserInfoDataCoinInfo fromString(String string) {
    var json = jsonDecode(string);
    return $UserInfoDataCoinInfoFromJson(json);
  }
}

import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
  LoginData? data;
  int? errorCode;
  String? errorMsg;

  LoginEntity();

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      $LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  static LoginEntity fromString(String string) {
    var json = jsonDecode(string);
    return $LoginEntityFromJson(json);
  }
}

@JsonSerializable()
class LoginData {
  bool? admin;
  List<dynamic>? chapterTops;
  int? coinCount;
  List<int>? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  LoginData();

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      $LoginDataFromJson(json);

  Map<String, dynamic> toJson() => $LoginDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  static LoginData fromString(String string) {
    var json = jsonDecode(string);
    return $LoginDataFromJson(json);
  }
}

import 'dart:convert';
import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/coin_entity.g.dart';

@JsonSerializable()
class CoinEntity {
  CoinData? data;
  int? errorCode;
  String? errorMsg;

  CoinEntity();

  factory CoinEntity.fromJson(Map<String, dynamic> json) =>
      $CoinEntityFromJson(json);

  Map<String, dynamic> toJson() => $CoinEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CoinData {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  CoinData();

  factory CoinData.fromJson(Map<String, dynamic> json) =>
      $CoinDataFromJson(json);

  Map<String, dynamic> toJson() => $CoinDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

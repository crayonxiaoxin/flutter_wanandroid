import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/coin_list_entity.g.dart';

@JsonSerializable()
class CoinListEntity {
  int? curPage;
  List<CoinListDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  CoinListEntity();

  factory CoinListEntity.fromJson(Map<String, dynamic> json) =>
      $CoinListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CoinListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CoinListDatas {
  int? coinCount;
  int? date;
  String? desc;
  int? id;
  String? reason;
  int? type;
  int? userId;
  String? userName;

  CoinListDatas();

  factory CoinListDatas.fromJson(Map<String, dynamic> json) =>
      $CoinListDatasFromJson(json);

  Map<String, dynamic> toJson() => $CoinListDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

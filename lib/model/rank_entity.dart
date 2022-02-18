import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/rank_entity.g.dart';

@JsonSerializable()
class RankEntity {
  int? curPage;
  List<RankDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  RankEntity();

  factory RankEntity.fromJson(Map<String, dynamic> json) =>
      $RankEntityFromJson(json);

  Map<String, dynamic> toJson() => $RankEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RankDatas {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  RankDatas();

  factory RankDatas.fromJson(Map<String, dynamic> json) =>
      $RankDatasFromJson(json);

  Map<String, dynamic> toJson() => $RankDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

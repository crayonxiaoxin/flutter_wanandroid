import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/collect_entity.g.dart';

@JsonSerializable()
class CollectEntity {
  int? curPage;
  List<CollectDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  CollectEntity();

  factory CollectEntity.fromJson(Map<String, dynamic> json) =>
      $CollectEntityFromJson(json);

  Map<String, dynamic> toJson() => $CollectEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectDatas {
  String? author;
  int? chapterId;
  String? chapterName;
  int? courseId;
  String? desc;
  String? envelopePic;
  int? id;
  String? link;
  String? niceDate;
  String? origin;
  int? originId;
  int? publishTime;
  String? title;
  int? userId;
  int? visible;
  int? zan;

  CollectDatas();

  factory CollectDatas.fromJson(Map<String, dynamic> json) =>
      $CollectDatasFromJson(json);

  Map<String, dynamic> toJson() => $CollectDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

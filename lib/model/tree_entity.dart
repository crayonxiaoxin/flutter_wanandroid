import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/tree_entity.g.dart';

@JsonSerializable()
class TreeEntity {
  List<TreeData>? data;
  int? errorCode;
  String? errorMsg;

  TreeEntity();

  factory TreeEntity.fromJson(Map<String, dynamic> json) =>
      $TreeEntityFromJson(json);

  Map<String, dynamic> toJson() => $TreeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TreeData {
  List<TreeDataChildren>? children;
  int? courseId;
  int? id;
  String? name;
  int? order;
  int? parentChapterId;
  bool? userControlSetTop;
  int? visible;

  TreeData();

  factory TreeData.fromJson(Map<String, dynamic> json) =>
      $TreeDataFromJson(json);

  Map<String, dynamic> toJson() => $TreeDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TreeDataChildren {
  List<dynamic>? children;
  int? courseId;
  int? id;
  String? name;
  int? order;
  int? parentChapterId;
  bool? userControlSetTop;
  int? visible;

  TreeDataChildren();

  factory TreeDataChildren.fromJson(Map<String, dynamic> json) =>
      $TreeDataChildrenFromJson(json);

  Map<String, dynamic> toJson() => $TreeDataChildrenToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

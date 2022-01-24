import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/hotkey_entity.g.dart';

@JsonSerializable()
class HotkeyEntity {
  List<HotkeyData>? data;
  int? errorCode;
  String? errorMsg;

  HotkeyEntity();

  factory HotkeyEntity.fromJson(Map<String, dynamic> json) =>
      $HotkeyEntityFromJson(json);

  Map<String, dynamic> toJson() => $HotkeyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HotkeyData {
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  HotkeyData();

  factory HotkeyData.fromJson(Map<String, dynamic> json) =>
      $HotkeyDataFromJson(json);

  Map<String, dynamic> toJson() => $HotkeyDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

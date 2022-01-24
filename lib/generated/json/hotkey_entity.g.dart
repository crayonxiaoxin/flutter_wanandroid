import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';

HotkeyEntity $HotkeyEntityFromJson(Map<String, dynamic> json) {
  final HotkeyEntity hotkeyEntity = HotkeyEntity();
  final List<HotkeyData>? data =
      jsonConvert.convertListNotNull<HotkeyData>(json['data']);
  if (data != null) {
    hotkeyEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    hotkeyEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    hotkeyEntity.errorMsg = errorMsg;
  }
  return hotkeyEntity;
}

Map<String, dynamic> $HotkeyEntityToJson(HotkeyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

HotkeyData $HotkeyDataFromJson(Map<String, dynamic> json) {
  final HotkeyData hotkeyData = HotkeyData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    hotkeyData.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    hotkeyData.link = link;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    hotkeyData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    hotkeyData.order = order;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    hotkeyData.visible = visible;
  }
  return hotkeyData;
}

Map<String, dynamic> $HotkeyDataToJson(HotkeyData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['visible'] = entity.visible;
  return data;
}

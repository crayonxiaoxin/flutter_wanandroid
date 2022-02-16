import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/wx_public_entity.dart';

WxPublicEntity $WxPublicEntityFromJson(Map<String, dynamic> json) {
  final WxPublicEntity wxPublicEntity = WxPublicEntity();
  final List<WxPublicData>? data =
      jsonConvert.convertListNotNull<WxPublicData>(json['data']);
  if (data != null) {
    wxPublicEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    wxPublicEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    wxPublicEntity.errorMsg = errorMsg;
  }
  return wxPublicEntity;
}

Map<String, dynamic> $WxPublicEntityToJson(WxPublicEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

WxPublicData $WxPublicDataFromJson(Map<String, dynamic> json) {
  final WxPublicData wxPublicData = WxPublicData();
  final List<dynamic>? children =
      jsonConvert.convertListNotNull<dynamic>(json['children']);
  if (children != null) {
    wxPublicData.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    wxPublicData.courseId = courseId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    wxPublicData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    wxPublicData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    wxPublicData.order = order;
  }
  final int? parentChapterId =
      jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    wxPublicData.parentChapterId = parentChapterId;
  }
  final bool? userControlSetTop =
      jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    wxPublicData.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    wxPublicData.visible = visible;
  }
  return wxPublicData;
}

Map<String, dynamic> $WxPublicDataToJson(WxPublicData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['children'] = entity.children;
  data['courseId'] = entity.courseId;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['parentChapterId'] = entity.parentChapterId;
  data['userControlSetTop'] = entity.userControlSetTop;
  data['visible'] = entity.visible;
  return data;
}

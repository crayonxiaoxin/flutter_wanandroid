import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';

TreeEntity $TreeEntityFromJson(Map<String, dynamic> json) {
  final TreeEntity treeEntity = TreeEntity();
  final List<TreeData>? data =
      jsonConvert.convertListNotNull<TreeData>(json['data']);
  if (data != null) {
    treeEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    treeEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    treeEntity.errorMsg = errorMsg;
  }
  return treeEntity;
}

Map<String, dynamic> $TreeEntityToJson(TreeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

TreeData $TreeDataFromJson(Map<String, dynamic> json) {
  final TreeData treeData = TreeData();
  final List<TreeDataChildren>? children =
      jsonConvert.convertListNotNull<TreeDataChildren>(json['children']);
  if (children != null) {
    treeData.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    treeData.courseId = courseId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    treeData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    treeData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    treeData.order = order;
  }
  final int? parentChapterId =
      jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    treeData.parentChapterId = parentChapterId;
  }
  final bool? userControlSetTop =
      jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    treeData.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    treeData.visible = visible;
  }
  return treeData;
}

Map<String, dynamic> $TreeDataToJson(TreeData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['children'] = entity.children?.map((v) => v.toJson()).toList();
  data['courseId'] = entity.courseId;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['parentChapterId'] = entity.parentChapterId;
  data['userControlSetTop'] = entity.userControlSetTop;
  data['visible'] = entity.visible;
  return data;
}

TreeDataChildren $TreeDataChildrenFromJson(Map<String, dynamic> json) {
  final TreeDataChildren treeDataChildren = TreeDataChildren();
  final List<dynamic>? children =
      jsonConvert.convertListNotNull<dynamic>(json['children']);
  if (children != null) {
    treeDataChildren.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    treeDataChildren.courseId = courseId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    treeDataChildren.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    treeDataChildren.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    treeDataChildren.order = order;
  }
  final int? parentChapterId =
      jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    treeDataChildren.parentChapterId = parentChapterId;
  }
  final bool? userControlSetTop =
      jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    treeDataChildren.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    treeDataChildren.visible = visible;
  }
  return treeDataChildren;
}

Map<String, dynamic> $TreeDataChildrenToJson(TreeDataChildren entity) {
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

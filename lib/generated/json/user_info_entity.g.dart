import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/login_entity.dart';
import 'package:flutter_wan_android/model/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
  final UserInfoEntity userInfoEntity = UserInfoEntity();
  final UserInfoData? data = jsonConvert.convert<UserInfoData>(json['data']);
  if (data != null) {
    userInfoEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    userInfoEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    userInfoEntity.errorMsg = errorMsg;
  }
  return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

UserInfoData $UserInfoDataFromJson(Map<String, dynamic> json) {
  final UserInfoData userInfoData = UserInfoData();
  final UserInfoDataCoinInfo? coinInfo =
      jsonConvert.convert<UserInfoDataCoinInfo>(json['coinInfo']);
  if (coinInfo != null) {
    userInfoData.coinInfo = coinInfo;
  }
  final LoginData? userInfo = jsonConvert.convert<LoginData>(json['userInfo']);
  if (userInfo != null) {
    userInfoData.userInfo = userInfo;
  }
  return userInfoData;
}

Map<String, dynamic> $UserInfoDataToJson(UserInfoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinInfo'] = entity.coinInfo?.toJson();
  data['userInfo'] = entity.userInfo?.toJson();
  return data;
}

UserInfoDataCoinInfo $UserInfoDataCoinInfoFromJson(Map<String, dynamic> json) {
  final UserInfoDataCoinInfo userInfoDataCoinInfo = UserInfoDataCoinInfo();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    userInfoDataCoinInfo.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userInfoDataCoinInfo.level = level;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    userInfoDataCoinInfo.nickname = nickname;
  }
  final String? rank = jsonConvert.convert<String>(json['rank']);
  if (rank != null) {
    userInfoDataCoinInfo.rank = rank;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userInfoDataCoinInfo.userId = userId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoDataCoinInfo.username = username;
  }
  return userInfoDataCoinInfo;
}

Map<String, dynamic> $UserInfoDataCoinInfoToJson(UserInfoDataCoinInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['nickname'] = entity.nickname;
  data['rank'] = entity.rank;
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  return data;
}

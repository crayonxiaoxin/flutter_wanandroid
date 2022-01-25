import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/model/coin_entity.dart';

CoinEntity $CoinEntityFromJson(Map<String, dynamic> json) {
  final CoinEntity coinEntity = CoinEntity();
  final CoinData? data = jsonConvert.convert<CoinData>(json['data']);
  if (data != null) {
    coinEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    coinEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    coinEntity.errorMsg = errorMsg;
  }
  return coinEntity;
}

Map<String, dynamic> $CoinEntityToJson(CoinEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

CoinData $CoinDataFromJson(Map<String, dynamic> json) {
  final CoinData coinData = CoinData();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    coinData.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    coinData.level = level;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    coinData.nickname = nickname;
  }
  final String? rank = jsonConvert.convert<String>(json['rank']);
  if (rank != null) {
    coinData.rank = rank;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    coinData.userId = userId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    coinData.username = username;
  }
  return coinData;
}

Map<String, dynamic> $CoinDataToJson(CoinData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['nickname'] = entity.nickname;
  data['rank'] = entity.rank;
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  return data;
}

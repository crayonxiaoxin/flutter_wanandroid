import 'dart:convert';

import 'package:lx_net/request/lx_base_request.dart';

/// 请求抽象类
abstract class LxNetAdapter {
  Future<LxResponse<dynamic>> send(LxBaseRequest request);
}

/// 统一返回
class LxResponse<T> {
  T? data;
  LxBaseRequest? request;
  int? statusCode;
  String? statusMessage;
  dynamic extra;

  LxResponse(
      {this.statusCode,
      this.statusMessage,
      this.data,
      this.request,
      this.extra});

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}

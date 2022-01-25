import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lx_net/request/lx_base_request.dart';

import 'lx_error.dart';
import 'lx_net_adapter.dart';

class DioAdapter extends LxNetAdapter {
  @override
  Future<LxResponse> send(LxBaseRequest request) async {
    Response? response;
    Exception? error;
    var options = Options(headers: request.headers);
    var method = request.httpMethod();
    try {
      if (method == HttpMethod.GET) {
        response = await Dio().get(request.url(),
            queryParameters: request.params, options: options);
      } else if (method == HttpMethod.POST) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (method == HttpMethod.DELETE) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (method == HttpMethod.PUT) {
        response = await Dio()
            .put(request.url(), data: request.params, options: options);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }
    if (kDebugMode) {
      print("dio headers: ${request.headers}");
      print("dio params: ${request.params}");
      print("dio response: $response");
      print("dio error: $error");
    }
    if (error != null) {
      throw LxNetError(response?.statusCode, error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request);
  }

  LxResponse buildRes(Response<dynamic>? response, LxBaseRequest request) {
    return LxResponse(
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
        data: response?.data,
        request: request,
        extra: response);
  }
}

import 'package:flutter/foundation.dart';

/// 请求方法
enum HttpMethod { GET, POST, PUT, DELETE }

/// 基础请求
abstract class LxBaseRequest {
  var pathParams;
  var useHttps = true;

  String domain();

  String path();

  HttpMethod httpMethod();

  bool needLogin();

  Map<String, String> headers = {};
  Map<String, String> params = {};

  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (pathStr.endsWith("/")) {
        pathStr += "$pathParams";
      } else {
        pathStr += "/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(domain(), pathStr, params);
    } else {
      uri = Uri.http(domain(), pathStr, params);
    }
    var url = uri.toString();
    if (kDebugMode) {
      print("url: $url");
    }
    return url;
  }

  LxBaseRequest addHeader(String key, dynamic value) {
    headers[key] = value.toString();
    return this;
  }

  LxBaseRequest addParam(String key, dynamic value) {
    params[key] = value.toString();
    return this;
  }
}

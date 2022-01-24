import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class QueryRequest extends BaseRequest {
  var page = 1;

  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "article/query/${page - 1}/json";
  }
}

import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class HomeTopArticleRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  String path() {
    return "article/top/json";
  }

  @override
  bool needLogin() {
    return false;
  }
}

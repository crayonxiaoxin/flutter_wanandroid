import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class HomeArticleRequest extends BaseRequest {
  int page;

  HomeArticleRequest(this.page);

  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  String path() {
    return "article/list/${page - 1}/json";
  }

  @override
  bool needLogin() {
    return false;
  }
}

import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class PrivateArticleRequest extends BaseRequest {
  int page;

  PrivateArticleRequest(this.page);

  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return "user/lg/private_articles/$page/json";
  }
}

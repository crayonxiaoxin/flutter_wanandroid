import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class WxArticleRequest extends BaseRequest {
  int page;
  int publicId;

  WxArticleRequest(this.page, this.publicId);

  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "wxarticle/list/$publicId/$page/json";
  }
}

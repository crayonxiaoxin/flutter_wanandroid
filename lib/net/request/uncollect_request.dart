import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class UnCollectRequest extends BaseRequest {
  final int id;

  /// 来自文章页面 还是 来自收藏页面
  final bool fromCollectPage;

  UnCollectRequest(this.id, {this.fromCollectPage = false});

  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return "lg/${fromCollectPage ? "uncollect" : "uncollect_originId"}/$id/json";
  }
}

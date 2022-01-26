import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class CoinListRequest extends BaseRequest {
  int page;

  CoinListRequest(this.page);

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
    return "lg/coin/list/$page/json";
  }
}

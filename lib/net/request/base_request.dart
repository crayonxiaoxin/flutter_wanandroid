import 'package:lx_net/request/lx_base_request.dart';

abstract class BaseRequest extends LxBaseRequest {
  @override
  String domain() {
    return "www.wanandroid.com";
  }
}

import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:lx_net/request/lx_base_request.dart';

abstract class BaseRequest extends LxBaseRequest {
  @override
  String domain() {
    return "www.wanandroid.com";
  }

  @override
  String url() {
    if (needLogin()) {
      headers = LoginDao.headers();
    }
    return super.url();
  }
}

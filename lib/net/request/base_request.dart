import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:lx_net/request/lx_base_request.dart';

abstract class BaseRequest extends LxBaseRequest {
  /// baseUrl
  @override
  String domain() {
    return "www.wanandroid.com";
  }

  /// 统一请求头，用于保持登录态
  @override
  get headers => LoginDao.headers();
}

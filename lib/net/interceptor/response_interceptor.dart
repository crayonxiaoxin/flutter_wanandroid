import 'package:flutter_wan_android/net/dao/login_dao.dart';
import 'package:flutter_wan_android/route/router.dart';
import 'package:lx_base/utils/toast.dart';
import 'package:lx_net/core/lx_net_adapter.dart';
import 'package:lx_net/request/lx_base_request.dart';

/// 响应拦截器
/// errorCode == -1001 时，跳转登录页面
class ResponseInterceptor extends LxNetInterceptor {
  @override
  LxResponse? intercept(LxResponse<dynamic>? response, LxBaseRequest request) {
    if (response?.extra.data['errorCode'] == -1001) {
      var context = routerKey.currentState?.context;
      if (context != null) {
        toast("请先登录！");
        // 清除登录缓存
        LoginDao.logout();
        MyRouterDelegate.of(context).push(MyRoutePath.login());
      }
    }
    return response;
  }
}

library lx_net;

import 'package:flutter/foundation.dart';
import 'package:lx_net/request/lx_base_request.dart';

import 'core/dio_adapter.dart';
import 'core/lx_error.dart';
import 'core/lx_net_adapter.dart';

/// 网络请求单例
class LxNet {
  LxNet._();

  factory LxNet() => _getInstance();

  static LxNet get instance => _getInstance();

  static LxNet? _instance;

  static LxNet _getInstance() {
    _instance ??= LxNet._();
    return _instance!;
  }

  /// 预初始化，设置拦截器&适配器
  static LxNet preInit(
      {required LxNetInterceptor interceptor, LxNetAdapter? adapter}) {
    var instance = _getInstance();
    instance.addInterceptor(interceptor);
    if (adapter != null) {
      instance.setAdapter(adapter);
    }
    return instance;
  }

  LxNetAdapter? _netAdapter;

  /// 适配器
  LxNet setAdapter(LxNetAdapter adapter) {
    _netAdapter = adapter;
    return this;
  }

  final Map<String, LxNetInterceptor> _netInterceptors = {};

  /// 拦截器
  LxNet addInterceptor(LxNetInterceptor interceptor) {
    _netInterceptors[interceptor.runtimeType.toString()] = interceptor;
    return this;
  }

  Future request(LxBaseRequest request) async {
    LxResponse? response;
    var error;
    try {
      response = await send(request);
      for (var entry in _netInterceptors.entries) {
        response = entry.value.intercept(response, request);
      }
    } on LxNetError catch (e) {
      error = e;
      response = e.data;
    } catch (e) {
      error = e;
    }
    if (response == null) {
      print("lx_net: error => $error");
    }
    var result = response?.data;
    var status = response?.statusCode;
    switch (response?.statusCode) {
      case 200:
        return result;
      default:
        throw LxNetError(status ?? -1, result.toString(), data: result);
    }
  }

  Future<LxResponse> send(LxBaseRequest request) {
    if (kDebugMode) {
      print("lx_net: ${request.params}");
    }
    _netAdapter ??= DioAdapter();
    return _netAdapter!.send(request);
  }
}

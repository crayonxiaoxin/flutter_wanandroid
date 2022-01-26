import 'package:flutter_wan_android/model/coin_entity.dart';
import 'package:flutter_wan_android/model/coin_list_entity.dart';
import 'package:flutter_wan_android/model/login_entity.dart';
import 'package:flutter_wan_android/model/user_info_entity.dart';
import 'package:flutter_wan_android/net/request/coin_list_request.dart';
import 'package:flutter_wan_android/net/request/coin_request.dart';
import 'package:flutter_wan_android/net/request/login_request.dart';
import 'package:flutter_wan_android/net/request/register_request.dart';
import 'package:flutter_wan_android/net/request/user_info_request.dart';
import 'package:lx_cache/lx_cache.dart';
import 'package:lx_net/core/lx_error.dart';
import 'package:lx_net/core/lx_net_adapter.dart';
import 'package:lx_net/lx_net.dart';

class LoginDao {
  static const String KEY_USER_INFO = "user_info";
  static const String KEY_COIN_INFO = "coin_info";
  static const String KEY_AUTH_HEADERS = "auth_headers";

  /// 登录
  static Future<LoginEntity> login(String login, String password) async {
    var request = LoginRequest();
    request
        .addParam("username", login.trim())
        .addParam("password", password.trim());
    LxResponse? response;
    var error;
    try {
      response = await LxNet.instance.send(request);
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
        var res = LoginEntity.fromJson(result);
        if (res.errorCode == 0) {
          var headers = response?.extra.headers.map['set-cookie'].toString();
          print("login headers: $headers");
          LxCache.instance.setString(
              KEY_USER_INFO, res.data == null ? "" : res.data.toString());
          LxCache.instance.setString(KEY_AUTH_HEADERS, headers ?? "");
        }
        return res;
      default:
        throw LxNetError(status ?? -1, result.toString(), data: result);
    }
  }

  /// 注册
  static Future<bool> register(String login, String password) async {
    var request = RegisterRequest();
    request
        .addParam("username", login)
        .addParam("password", password)
        .addParam("repassword", password);
    var response = await LxNet.instance.request(request);
    print(response);
    return response['errorCode'] == 0;
  }

  /// 个人信息
  static Future<UserInfoEntity> getUserInfo() async {
    var request = UserInfoRequest();
    var response = await LxNet.instance.request(request);
    var res = UserInfoEntity.fromJson(response);
    if (res.errorCode == 0) {
      LxCache.instance
          .setString(KEY_USER_INFO, res.data?.userInfo.toString() ?? "");
      LxCache.instance
          .setString(KEY_COIN_INFO, res.data?.coinInfo.toString() ?? "");
    }
    return UserInfoEntity.fromJson(response);
  }

  /// 个人积分
  static Future<CoinEntity> getCoinCount() async {
    var request = CoinRequest();
    var response = await LxNet.instance.request(request);
    return CoinEntity.fromJson(response);
  }

  /// 个人积分列表
  static Future<CoinListEntity> getCoinList(
      {int page = 1, int pageSize = 20}) async {
    var request = CoinListRequest(page)..addParam("page_size", pageSize);
    var response = await LxNet.instance.request(request);
    return CoinListEntity.fromJson(response['data']);
  }

  /// 登录状态验证
  static Map<String, String> headers() {
    var jsonList = LxCache.instance.getString(KEY_AUTH_HEADERS);
    Map<String, String> headers =
        jsonList.isNotEmpty ? {"Cookie": jsonList} : {};
    print("header:$headers");
    return headers;
  }

  /// 是否已经登录
  static bool get isLogin => headers().isNotEmpty;

  static logout() {
    LxCache.instance.setString(KEY_AUTH_HEADERS, "");
  }

  /// 本地用户资料
  static LoginData? userInfo() {
    var json = LxCache.instance.getString(KEY_USER_INFO);
    if (json.isEmpty) return null;
    return LoginData.fromString(json);
  }

  /// 本地用户积分资料
  static UserInfoDataCoinInfo? coinInfo() {
    var json = LxCache.instance.getString(KEY_COIN_INFO);
    if (json.isEmpty) return null;
    return UserInfoDataCoinInfo.fromString(json);
  }
}

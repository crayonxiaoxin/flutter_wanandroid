import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';
import 'package:flutter_wan_android/net/request/query_hotkey_request.dart';
import 'package:flutter_wan_android/net/request/query_request.dart';
import 'package:lx_net/lx_net.dart';

class QueryDao {
  /// 搜索
  static Future<HomeArticleEntity> query(
      {String keyword = "", int page = 1, int pageSize = 20}) async {
    var request = QueryRequest();
    request.page = page;
    request.addParam("page_size", pageSize);
    request.addParam("k", keyword);
    var response = await LxNet.instance.request(request);
    return HomeArticleEntity.fromJson(response['data']);
  }

  /// 搜索热词
  static Future<HotkeyEntity> hotKey() async {
    var request = QueryHotkeyRequest();
    var response = await LxNet.instance.request(request);
    return HotkeyEntity.fromJson(response);
  }
}

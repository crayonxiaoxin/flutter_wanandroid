import 'package:flutter_wan_android/model/navi_entity.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';
import 'package:flutter_wan_android/net/request/navi_request.dart';
import 'package:flutter_wan_android/net/request/tree_request.dart';
import 'package:lx_net/lx_net.dart';

/// 体系 & 导航
class SysDao {
  /// 体系
  static Future<TreeEntity> getTree() async {
    var request = TreeRequest();
    var response = await LxNet.instance.request(request);
    return TreeEntity.fromJson(response);
  }

  /// 导航
  static Future<NaviEntity> getNavigation() async {
    var request = NaviRequest();
    var response = await LxNet.instance.request(request);
    return NaviEntity.fromJson(response);
  }
}

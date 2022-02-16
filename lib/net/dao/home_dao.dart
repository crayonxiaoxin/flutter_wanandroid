import 'package:flutter_wan_android/model/collect_entity.dart';
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:flutter_wan_android/model/home_top_article_entity.dart';
import 'package:flutter_wan_android/net/request/collect_list_request.dart';
import 'package:flutter_wan_android/net/request/collect_request.dart';
import 'package:flutter_wan_android/net/request/home_article_request.dart';
import 'package:flutter_wan_android/net/request/home_banner_request.dart';
import 'package:flutter_wan_android/net/request/home_top_article_request.dart';
import 'package:flutter_wan_android/net/request/project_request.dart';
import 'package:flutter_wan_android/net/request/qa_request.dart';
import 'package:flutter_wan_android/net/request/uncollect_request.dart';
import 'package:flutter_wan_android/net/request/wx_article_request.dart';
import 'package:lx_net/lx_net.dart';

/// 首页 & 问答
class HomeDao {
  /// 首页文章
  static Future<HomeArticleEntity> getArticles(
      {int page = 1, int pageSize = 20, dynamic cid}) async {
    var request = HomeArticleRequest(page);
    if (cid != null) {
      // 体系下的文章
      request.addParam("cid", cid);
    }
    request.addParam("page_size", pageSize);
    var response = await LxNet.instance.request(request);
    return HomeArticleEntity.fromJson(response['data']);
  }

  /// 置顶文章
  static Future<HomeTopArticleEntity> getTopArticles() async {
    var request = HomeTopArticleRequest();
    var response = await LxNet.instance.request(request);
    return HomeTopArticleEntity.fromJson(response);
  }

  /// 首页 banner
  static Future<HomeBannerEntity> getBanners() async {
    var request = HomeBannerRequest();
    var response = await LxNet.instance.request(request);
    return HomeBannerEntity.fromJson(response);
  }

  /// 问答
  static Future<HomeArticleEntity> getQAs(
      {int page = 1, int pageSize = 20}) async {
    var request = QaRequest(page);
    request.addParam("page_size", pageSize);
    var response = await LxNet.instance.request(request);
    return HomeArticleEntity.fromJson(response['data']);
  }

  /// 公众号
  static Future<HomeArticleEntity> getWxArticles(int publicId,
      {int page = 1, int pageSize = 20}) async {
    var request = WxArticleRequest(page, publicId);
    request.addParam("page_size", pageSize);
    var response = await LxNet.instance.request(request);
    return HomeArticleEntity.fromJson(response['data']);
  }

  /// 公众号
  static Future<HomeArticleEntity> getProjects(int projectId,
      {int page = 1, int pageSize = 20}) async {
    var request = ProjectRequest(page, projectId);
    request.addParam("page_size", pageSize).addParam("cid", projectId);
    var response = await LxNet.instance.request(request);
    return HomeArticleEntity.fromJson(response['data']);
  }

  static Future<bool> collectArticle(int? id) async {
    if (id == null) return false;
    var request = CollectRequest(id);
    var response = await LxNet.instance.request(request);
    return response['errorCode'] == 0;
  }

  static Future<bool> unCollectArticle(int? id, {originId}) async {
    if (id == null) return false;
    var request = UnCollectRequest(id, fromCollectPage: originId != null);
    if (originId != null) {
      request.addParam("originId", originId);
    }
    var response = await LxNet.instance.request(request);
    print(response);
    return response['errorCode'] == 0;
  }

  /// 收藏列表
  static Future<CollectEntity> getCollectList(
      {int page = 1, int pageSize = 20}) async {
    var request = CollectListRequest(page);
    request.addParam("page_size", pageSize);
    var response = await LxNet.instance.request(request);
    return CollectEntity.fromJson(response['data']);
  }
}

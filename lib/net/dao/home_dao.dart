import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:flutter_wan_android/model/home_top_article_entity.dart';
import 'package:flutter_wan_android/net/request/home_article_request.dart';
import 'package:flutter_wan_android/net/request/home_banner_request.dart';
import 'package:flutter_wan_android/net/request/home_top_article_request.dart';
import 'package:flutter_wan_android/net/request/qa_request.dart';
import 'package:lx_net/lx_net.dart';

/// 首页 & 问答
class HomeDao {
  static Future<HomeArticleEntity> getArticles(
      {int page = 1, int pageSize = 20, dynamic cid}) async {
    var request = HomeArticleRequest();
    request.page = page;
    if (cid != null) {
      // 体系下的文章
      request.addParam("cid", cid);
    }
    request.addParam("page_size", pageSize);
    var response = await LxNet.instance.request(request);
    return HomeArticleEntity.fromJson(response['data']);
  }

  static Future<HomeTopArticleEntity> getTopArticles() async {
    var request = HomeTopArticleRequest();
    var response = await LxNet.instance.request(request);
    return HomeTopArticleEntity.fromJson(response);
  }

  static Future<HomeBannerEntity> getBanners() async {
    var request = HomeBannerRequest();
    var response = await LxNet.instance.request(request);
    return HomeBannerEntity.fromJson(response);
  }

  static Future<HomeArticleEntity> getQAs(
      {int page = 1, int pageSize = 20}) async {
    var request = QaRequest();
    request.page = page;
    request.addParam("page_size", pageSize);
    var response = await LxNet.instance.request(request);
    return HomeArticleEntity.fromJson(response['data']);
  }
}

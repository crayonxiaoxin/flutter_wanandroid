// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_wan_android/model/home_article_entity.dart';
import 'package:flutter_wan_android/model/home_banner_entity.dart';
import 'package:flutter_wan_android/model/home_top_article_entity.dart';
import 'package:flutter_wan_android/model/hotkey_entity.dart';
import 'package:flutter_wan_android/model/navi_entity.dart';
import 'package:flutter_wan_android/model/tree_entity.dart';

JsonConvert jsonConvert = JsonConvert();

class JsonConvert {
  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return JsonConvert.fromJsonAsT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  }

  //Go back to a single instance by type
  static M? _fromJsonSingle<M>(Map<String, dynamic> json) {
    final String type = M.toString();
    if (type == (HomeArticleEntity).toString()) {
      return HomeArticleEntity.fromJson(json) as M;
    }
    if (type == (HomeArticleDatas).toString()) {
      return HomeArticleDatas.fromJson(json) as M;
    }
    if (type == (HomeArticleDatasTags).toString()) {
      return HomeArticleDatasTags.fromJson(json) as M;
    }
    if (type == (HomeBannerEntity).toString()) {
      return HomeBannerEntity.fromJson(json) as M;
    }
    if (type == (HomeBannerData).toString()) {
      return HomeBannerData.fromJson(json) as M;
    }
    if (type == (HomeTopArticleEntity).toString()) {
      return HomeTopArticleEntity.fromJson(json) as M;
    }
    if (type == (HotkeyEntity).toString()) {
      return HotkeyEntity.fromJson(json) as M;
    }
    if (type == (HotkeyData).toString()) {
      return HotkeyData.fromJson(json) as M;
    }
    if (type == (NaviEntity).toString()) {
      return NaviEntity.fromJson(json) as M;
    }
    if (type == (NaviData).toString()) {
      return NaviData.fromJson(json) as M;
    }
    if (type == (TreeEntity).toString()) {
      return TreeEntity.fromJson(json) as M;
    }
    if (type == (TreeData).toString()) {
      return TreeData.fromJson(json) as M;
    }
    if (type == (TreeDataChildren).toString()) {
      return TreeDataChildren.fromJson(json) as M;
    }

    print("$type not found");

    return null;
  }

  //list is returned by type
  static M? _getListChildType<M>(List<dynamic> data) {
    if (<HomeArticleEntity>[] is M) {
      return data
          .map<HomeArticleEntity>((e) => HomeArticleEntity.fromJson(e))
          .toList() as M;
    }
    if (<HomeArticleDatas>[] is M) {
      return data
          .map<HomeArticleDatas>((e) => HomeArticleDatas.fromJson(e))
          .toList() as M;
    }
    if (<HomeArticleDatasTags>[] is M) {
      return data
          .map<HomeArticleDatasTags>((e) => HomeArticleDatasTags.fromJson(e))
          .toList() as M;
    }
    if (<HomeBannerEntity>[] is M) {
      return data
          .map<HomeBannerEntity>((e) => HomeBannerEntity.fromJson(e))
          .toList() as M;
    }
    if (<HomeBannerData>[] is M) {
      return data
          .map<HomeBannerData>((e) => HomeBannerData.fromJson(e))
          .toList() as M;
    }
    if (<HomeTopArticleEntity>[] is M) {
      return data
          .map<HomeTopArticleEntity>((e) => HomeTopArticleEntity.fromJson(e))
          .toList() as M;
    }
    if (<HotkeyEntity>[] is M) {
      return data.map<HotkeyEntity>((e) => HotkeyEntity.fromJson(e)).toList()
          as M;
    }
    if (<HotkeyData>[] is M) {
      return data.map<HotkeyData>((e) => HotkeyData.fromJson(e)).toList() as M;
    }
    if (<NaviEntity>[] is M) {
      return data.map<NaviEntity>((e) => NaviEntity.fromJson(e)).toList() as M;
    }
    if (<NaviData>[] is M) {
      return data.map<NaviData>((e) => NaviData.fromJson(e)).toList() as M;
    }
    if (<TreeEntity>[] is M) {
      return data.map<TreeEntity>((e) => TreeEntity.fromJson(e)).toList() as M;
    }
    if (<TreeData>[] is M) {
      return data.map<TreeData>((e) => TreeData.fromJson(e)).toList() as M;
    }
    if (<TreeDataChildren>[] is M) {
      return data
          .map<TreeDataChildren>((e) => TreeDataChildren.fromJson(e))
          .toList() as M;
    }

    print("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json as Map<String, dynamic>);
    }
  }
}

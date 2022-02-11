// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(reason) => "登录失败：${reason}";

  static String m1(level, rank) => "Lv.${level},  排名: ${rank}";

  static String m2(reason) => "注册失败：${reason}";

  static String m3(keyword) => "正在搜索: ${keyword}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Flutter 玩安卓"),
        "bottom_tab_home": MessageLookupByLibrary.simpleMessage("首页"),
        "bottom_tab_profile": MessageLookupByLibrary.simpleMessage("我的"),
        "bottom_tab_qa": MessageLookupByLibrary.simpleMessage("问答"),
        "bottom_tab_tree": MessageLookupByLibrary.simpleMessage("体系"),
        "coming_soon": MessageLookupByLibrary.simpleMessage("敬请期待！"),
        "copy_clipboard": MessageLookupByLibrary.simpleMessage("已将链接复制至剪贴板"),
        "dialog_no": MessageLookupByLibrary.simpleMessage("取消"),
        "dialog_prompt": MessageLookupByLibrary.simpleMessage("提示"),
        "dialog_prompt_logout":
            MessageLookupByLibrary.simpleMessage("您确定要退出登录吗？"),
        "dialog_yes": MessageLookupByLibrary.simpleMessage("确定"),
        "hot_keys": MessageLookupByLibrary.simpleMessage("热门搜索"),
        "load_complete": MessageLookupByLibrary.simpleMessage("加载完成"),
        "load_failed": MessageLookupByLibrary.simpleMessage("加载失败，请重试"),
        "load_more": MessageLookupByLibrary.simpleMessage("上拉加载更多"),
        "load_no_data": MessageLookupByLibrary.simpleMessage("没有更多了"),
        "loading": MessageLookupByLibrary.simpleMessage("加载中..."),
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "login_failed": m0,
        "login_success": MessageLookupByLibrary.simpleMessage("登录成功！"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "password_confirm": MessageLookupByLibrary.simpleMessage("确认密码"),
        "password_confirm_failed":
            MessageLookupByLibrary.simpleMessage("两次密码输入不一致！"),
        "profile_coin": MessageLookupByLibrary.simpleMessage("我的积分"),
        "profile_favorite": MessageLookupByLibrary.simpleMessage("我的收藏"),
        "profile_level": m1,
        "profile_logout": MessageLookupByLibrary.simpleMessage("退出登录"),
        "profile_not_login": MessageLookupByLibrary.simpleMessage("未登录"),
        "profile_settings": MessageLookupByLibrary.simpleMessage("系统设置"),
        "profile_share": MessageLookupByLibrary.simpleMessage("我的分享"),
        "register": MessageLookupByLibrary.simpleMessage("注册"),
        "register_failed": m2,
        "register_success": MessageLookupByLibrary.simpleMessage("注册成功！"),
        "search_box_hint":
            MessageLookupByLibrary.simpleMessage("支持多个关键词，请用空格隔开"),
        "searching": m3,
        "settings": MessageLookupByLibrary.simpleMessage("设置"),
        "settings_dark_mode": MessageLookupByLibrary.simpleMessage("黑夜模式"),
        "settings_follow_system": MessageLookupByLibrary.simpleMessage("跟随系统"),
        "settings_follow_system_desc":
            MessageLookupByLibrary.simpleMessage("黑夜模式跟随系统"),
        "settings_home_banner": MessageLookupByLibrary.simpleMessage("轮播图"),
        "settings_home_banner_desc":
            MessageLookupByLibrary.simpleMessage("是否显示首页轮播图"),
        "settings_home_top_articles":
            MessageLookupByLibrary.simpleMessage("置顶文章"),
        "settings_home_top_articles_desc":
            MessageLookupByLibrary.simpleMessage("是否显示首页置顶文章"),
        "switch_language": MessageLookupByLibrary.simpleMessage("切换语言"),
        "top_tab_navi": MessageLookupByLibrary.simpleMessage("导航"),
        "top_tab_tree": MessageLookupByLibrary.simpleMessage("体系"),
        "username": MessageLookupByLibrary.simpleMessage("用户名"),
        "username_password_empty":
            MessageLookupByLibrary.simpleMessage("用户名或密码不能为空")
      };
}

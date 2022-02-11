// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_HK locale. All the
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
  String get localeName => 'zh_HK';

  static String m0(reason) => "登錄失敗：${reason}";

  static String m1(level, rank) => "Lv.${level},  排名: ${rank}";

  static String m2(reason) => "註冊失敗：${reason}";

  static String m3(keyword) => "正在搜索: ${keyword}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Flutter 玩安卓"),
        "bottom_tab_home": MessageLookupByLibrary.simpleMessage("首頁"),
        "bottom_tab_profile": MessageLookupByLibrary.simpleMessage("我的"),
        "bottom_tab_qa": MessageLookupByLibrary.simpleMessage("問答"),
        "bottom_tab_tree": MessageLookupByLibrary.simpleMessage("體系"),
        "coming_soon": MessageLookupByLibrary.simpleMessage("敬請期待！"),
        "copy_clipboard": MessageLookupByLibrary.simpleMessage("已將鏈接複製至剪貼板"),
        "dialog_no": MessageLookupByLibrary.simpleMessage("取消"),
        "dialog_prompt": MessageLookupByLibrary.simpleMessage("提示"),
        "dialog_prompt_logout":
            MessageLookupByLibrary.simpleMessage("您確定要退出登錄嗎？"),
        "dialog_yes": MessageLookupByLibrary.simpleMessage("確定"),
        "hot_keys": MessageLookupByLibrary.simpleMessage("熱門搜索"),
        "load_complete": MessageLookupByLibrary.simpleMessage("加載完成"),
        "load_failed": MessageLookupByLibrary.simpleMessage("加載失敗，請重試"),
        "load_more": MessageLookupByLibrary.simpleMessage("上拉加載更多"),
        "load_no_data": MessageLookupByLibrary.simpleMessage("沒有更多了"),
        "loading": MessageLookupByLibrary.simpleMessage("加載中..."),
        "login": MessageLookupByLibrary.simpleMessage("登錄"),
        "login_failed": m0,
        "login_success": MessageLookupByLibrary.simpleMessage("登錄成功！"),
        "password": MessageLookupByLibrary.simpleMessage("密碼"),
        "password_confirm": MessageLookupByLibrary.simpleMessage("確認密碼"),
        "password_confirm_failed":
            MessageLookupByLibrary.simpleMessage("兩次密碼輸入不一致！"),
        "profile_coin": MessageLookupByLibrary.simpleMessage("我的積分"),
        "profile_favorite": MessageLookupByLibrary.simpleMessage("我的收藏"),
        "profile_level": m1,
        "profile_logout": MessageLookupByLibrary.simpleMessage("退出登錄"),
        "profile_not_login": MessageLookupByLibrary.simpleMessage("未登錄"),
        "profile_settings": MessageLookupByLibrary.simpleMessage("系統設置"),
        "profile_share": MessageLookupByLibrary.simpleMessage("我的分享"),
        "register": MessageLookupByLibrary.simpleMessage("註冊"),
        "register_failed": m2,
        "register_success": MessageLookupByLibrary.simpleMessage("註冊成功！"),
        "search_box_hint":
            MessageLookupByLibrary.simpleMessage("支持多個關鍵詞，請用空格隔開"),
        "searching": m3,
        "settings": MessageLookupByLibrary.simpleMessage("設置"),
        "settings_dark_mode": MessageLookupByLibrary.simpleMessage("黑夜模式"),
        "settings_follow_system": MessageLookupByLibrary.simpleMessage("跟隨系統"),
        "settings_follow_system_desc":
            MessageLookupByLibrary.simpleMessage("黑夜模式跟隨系統"),
        "settings_home_banner": MessageLookupByLibrary.simpleMessage("輪播圖"),
        "settings_home_banner_desc":
            MessageLookupByLibrary.simpleMessage("是否顯示首頁輪播圖"),
        "settings_home_top_articles":
            MessageLookupByLibrary.simpleMessage("置頂文章"),
        "settings_home_top_articles_desc":
            MessageLookupByLibrary.simpleMessage("是否顯示首頁置頂文章"),
        "switch_language": MessageLookupByLibrary.simpleMessage("切換語言"),
        "top_tab_navi": MessageLookupByLibrary.simpleMessage("導航"),
        "top_tab_tree": MessageLookupByLibrary.simpleMessage("體系"),
        "username": MessageLookupByLibrary.simpleMessage("用戶名"),
        "username_password_empty":
            MessageLookupByLibrary.simpleMessage("用戶名或密碼不能為空")
      };
}

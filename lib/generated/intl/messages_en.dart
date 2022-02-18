// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(reason) => "Login Failed：${reason}";

  static String m1(level, rank) => "Lv.${level},  Ranking: ${rank}";

  static String m2(reason) => "Registration Failed：${reason}";

  static String m3(keyword) => "Searching: ${keyword}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Flutter WanAndroid"),
        "bottom_tab_home": MessageLookupByLibrary.simpleMessage("Home"),
        "bottom_tab_profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "bottom_tab_qa": MessageLookupByLibrary.simpleMessage("Q&A"),
        "bottom_tab_tree": MessageLookupByLibrary.simpleMessage("Tree"),
        "coming_soon": MessageLookupByLibrary.simpleMessage("Coming Soon!"),
        "copy_clipboard":
            MessageLookupByLibrary.simpleMessage("Link copied to clipboard"),
        "detail_intercept_open_app": MessageLookupByLibrary.simpleMessage(
            "Blocked: try to open Taobao or JD"),
        "dialog_no": MessageLookupByLibrary.simpleMessage("Cancel"),
        "dialog_prompt": MessageLookupByLibrary.simpleMessage("Notice"),
        "dialog_prompt_logout": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to logout?"),
        "dialog_yes": MessageLookupByLibrary.simpleMessage("OK"),
        "hot_keys": MessageLookupByLibrary.simpleMessage("Popular Searches"),
        "load_complete": MessageLookupByLibrary.simpleMessage("Completed"),
        "load_failed": MessageLookupByLibrary.simpleMessage(
            "Loading failed, please try again"),
        "load_more":
            MessageLookupByLibrary.simpleMessage("Pull up to load more"),
        "load_no_data": MessageLookupByLibrary.simpleMessage("No more Data"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "login_failed": m0,
        "login_success": MessageLookupByLibrary.simpleMessage("Login Success!"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_confirm":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "password_confirm_failed": MessageLookupByLibrary.simpleMessage(
            "The two password entries are inconsistent!"),
        "profile_coin": MessageLookupByLibrary.simpleMessage("My Scores"),
        "profile_favorite":
            MessageLookupByLibrary.simpleMessage("My Collection"),
        "profile_level": m1,
        "profile_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "profile_not_login":
            MessageLookupByLibrary.simpleMessage("Not logged in"),
        "profile_rank": MessageLookupByLibrary.simpleMessage("Ranking"),
        "profile_settings":
            MessageLookupByLibrary.simpleMessage("System Settings"),
        "profile_share": MessageLookupByLibrary.simpleMessage("My Share"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "register_failed": m2,
        "register_success":
            MessageLookupByLibrary.simpleMessage("Registration Success！"),
        "search_box_hint": MessageLookupByLibrary.simpleMessage(
            "Separate keywords with spaces"),
        "searching": m3,
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settings_dark_mode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "settings_follow_system":
            MessageLookupByLibrary.simpleMessage("System Adaptation"),
        "settings_follow_system_desc":
            MessageLookupByLibrary.simpleMessage("Dark Mode System Adaptive"),
        "settings_home_banner":
            MessageLookupByLibrary.simpleMessage("Home Banner"),
        "settings_home_banner_desc":
            MessageLookupByLibrary.simpleMessage("Show or Hide Home Banner"),
        "settings_home_top_articles":
            MessageLookupByLibrary.simpleMessage("Home Top Articles"),
        "settings_home_top_articles_desc": MessageLookupByLibrary.simpleMessage(
            "Show or Hide Home Top Articles"),
        "switch_language":
            MessageLookupByLibrary.simpleMessage("Switch Language"),
        "test_native_calls":
            MessageLookupByLibrary.simpleMessage("Test Native Calls"),
        "top_tab_navi": MessageLookupByLibrary.simpleMessage("Navigation"),
        "top_tab_project": MessageLookupByLibrary.simpleMessage("Projects"),
        "top_tab_tree": MessageLookupByLibrary.simpleMessage("Tree"),
        "top_tab_wx": MessageLookupByLibrary.simpleMessage("Official Account"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "username_password_empty": MessageLookupByLibrary.simpleMessage(
            "Username or password cannot be empty")
      };
}

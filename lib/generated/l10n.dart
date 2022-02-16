// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter WanAndroid`
  String get app_name {
    return Intl.message(
      'Flutter WanAndroid',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon!`
  String get coming_soon {
    return Intl.message(
      'Coming Soon!',
      name: 'coming_soon',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Loading failed, please try again`
  String get load_failed {
    return Intl.message(
      'Loading failed, please try again',
      name: 'load_failed',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get load_complete {
    return Intl.message(
      'Completed',
      name: 'load_complete',
      desc: '',
      args: [],
    );
  }

  /// `No more Data`
  String get load_no_data {
    return Intl.message(
      'No more Data',
      name: 'load_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Pull up to load more`
  String get load_more {
    return Intl.message(
      'Pull up to load more',
      name: 'load_more',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get password_confirm {
    return Intl.message(
      'Confirm Password',
      name: 'password_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Username or password cannot be empty`
  String get username_password_empty {
    return Intl.message(
      'Username or password cannot be empty',
      name: 'username_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `The two password entries are inconsistent!`
  String get password_confirm_failed {
    return Intl.message(
      'The two password entries are inconsistent!',
      name: 'password_confirm_failed',
      desc: '',
      args: [],
    );
  }

  /// `Registration Success！`
  String get register_success {
    return Intl.message(
      'Registration Success！',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `Registration Failed：{reason}`
  String register_failed(Object reason) {
    return Intl.message(
      'Registration Failed：$reason',
      name: 'register_failed',
      desc: '',
      args: [reason],
    );
  }

  /// `Login Success!`
  String get login_success {
    return Intl.message(
      'Login Success!',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed：{reason}`
  String login_failed(Object reason) {
    return Intl.message(
      'Login Failed：$reason',
      name: 'login_failed',
      desc: '',
      args: [reason],
    );
  }

  /// `Notice`
  String get dialog_prompt {
    return Intl.message(
      'Notice',
      name: 'dialog_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get dialog_prompt_logout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'dialog_prompt_logout',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get dialog_yes {
    return Intl.message(
      'OK',
      name: 'dialog_yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dialog_no {
    return Intl.message(
      'Cancel',
      name: 'dialog_no',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottom_tab_home {
    return Intl.message(
      'Home',
      name: 'bottom_tab_home',
      desc: '',
      args: [],
    );
  }

  /// `Q&A`
  String get bottom_tab_qa {
    return Intl.message(
      'Q&A',
      name: 'bottom_tab_qa',
      desc: '',
      args: [],
    );
  }

  /// `Tree`
  String get bottom_tab_tree {
    return Intl.message(
      'Tree',
      name: 'bottom_tab_tree',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get bottom_tab_profile {
    return Intl.message(
      'Profile',
      name: 'bottom_tab_profile',
      desc: '',
      args: [],
    );
  }

  /// `Tree`
  String get top_tab_tree {
    return Intl.message(
      'Tree',
      name: 'top_tab_tree',
      desc: '',
      args: [],
    );
  }

  /// `Navigation`
  String get top_tab_navi {
    return Intl.message(
      'Navigation',
      name: 'top_tab_navi',
      desc: '',
      args: [],
    );
  }

  /// `Official Account`
  String get top_tab_wx {
    return Intl.message(
      'Official Account',
      name: 'top_tab_wx',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get top_tab_project {
    return Intl.message(
      'Projects',
      name: 'top_tab_project',
      desc: '',
      args: [],
    );
  }

  /// `Lv.{level},  Ranking: {rank}`
  String profile_level(Object level, Object rank) {
    return Intl.message(
      'Lv.$level,  Ranking: $rank',
      name: 'profile_level',
      desc: '',
      args: [level, rank],
    );
  }

  /// `My Scores`
  String get profile_coin {
    return Intl.message(
      'My Scores',
      name: 'profile_coin',
      desc: '',
      args: [],
    );
  }

  /// `My Share`
  String get profile_share {
    return Intl.message(
      'My Share',
      name: 'profile_share',
      desc: '',
      args: [],
    );
  }

  /// `My Collection`
  String get profile_favorite {
    return Intl.message(
      'My Collection',
      name: 'profile_favorite',
      desc: '',
      args: [],
    );
  }

  /// `System Settings`
  String get profile_settings {
    return Intl.message(
      'System Settings',
      name: 'profile_settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profile_logout {
    return Intl.message(
      'Logout',
      name: 'profile_logout',
      desc: '',
      args: [],
    );
  }

  /// `Not logged in`
  String get profile_not_login {
    return Intl.message(
      'Not logged in',
      name: 'profile_not_login',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `System Adaptation`
  String get settings_follow_system {
    return Intl.message(
      'System Adaptation',
      name: 'settings_follow_system',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode System Adaptive`
  String get settings_follow_system_desc {
    return Intl.message(
      'Dark Mode System Adaptive',
      name: 'settings_follow_system_desc',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settings_dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'settings_dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Home Banner`
  String get settings_home_banner {
    return Intl.message(
      'Home Banner',
      name: 'settings_home_banner',
      desc: '',
      args: [],
    );
  }

  /// `Show or Hide Home Banner`
  String get settings_home_banner_desc {
    return Intl.message(
      'Show or Hide Home Banner',
      name: 'settings_home_banner_desc',
      desc: '',
      args: [],
    );
  }

  /// `Home Top Articles`
  String get settings_home_top_articles {
    return Intl.message(
      'Home Top Articles',
      name: 'settings_home_top_articles',
      desc: '',
      args: [],
    );
  }

  /// `Show or Hide Home Top Articles`
  String get settings_home_top_articles_desc {
    return Intl.message(
      'Show or Hide Home Top Articles',
      name: 'settings_home_top_articles_desc',
      desc: '',
      args: [],
    );
  }

  /// `Link copied to clipboard`
  String get copy_clipboard {
    return Intl.message(
      'Link copied to clipboard',
      name: 'copy_clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Popular Searches`
  String get hot_keys {
    return Intl.message(
      'Popular Searches',
      name: 'hot_keys',
      desc: '',
      args: [],
    );
  }

  /// `Separate keywords with spaces`
  String get search_box_hint {
    return Intl.message(
      'Separate keywords with spaces',
      name: 'search_box_hint',
      desc: '',
      args: [],
    );
  }

  /// `Searching: {keyword}`
  String searching(Object keyword) {
    return Intl.message(
      'Searching: $keyword',
      name: 'searching',
      desc: '',
      args: [keyword],
    );
  }

  /// `Switch Language`
  String get switch_language {
    return Intl.message(
      'Switch Language',
      name: 'switch_language',
      desc: '',
      args: [],
    );
  }

  /// `Test Native Calls`
  String get test_native_calls {
    return Intl.message(
      'Test Native Calls',
      name: 'test_native_calls',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

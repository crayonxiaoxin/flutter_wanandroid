import 'package:flutter_wan_android/provider/home_provider.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => HomeProvider())
];

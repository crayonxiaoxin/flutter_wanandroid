import 'package:flutter/material.dart';
import 'package:flutter_wan_android/pages/tab_home/tab_home_page.dart';
import 'package:flutter_wan_android/pages/tab_home/tab_profile_page.dart';
import 'package:flutter_wan_android/pages/tab_home/tab_qa_page.dart';
import 'package:flutter_wan_android/pages/tab_home/tab_sys_page.dart';
import 'package:flutter_wan_android/provider/home_provider.dart';
import 'package:flutter_wan_android/provider/theme_provider.dart';
import 'package:lx_base/lx_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends LxState<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    // LxCache.instance.setString("hello", "value");
    // String? value = LxCache.instance.get("hello");
    // print("lx cache value: $value");
    print("click");
    // setState(() {
    //   _counter++;
    // });
    // MyRouterDelegate.of(context).push(MyRoutePath.details(),
    //     onPopResult: (result) {
    //   toast(result);
    //   setState(() {
    //     _counter++;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (
          BuildContext context,
          HomeProvider value,
          Widget? child,
        ) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: const [
              TabHomePage(),
              TabQaPage(),
              TabSysPage(),
              ProfilePage()
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildBottomTabItem(Icons.home, "首页"),
          _buildBottomTabItem(Icons.comment, "问答"),
          _buildBottomTabItem(Icons.local_library, "体系"),
          _buildBottomTabItem(Icons.face, "我的"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomTabItem(IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        activeIcon: Icon(
          icon,
        ),
        label: label);
  }

  /// 监听系统主题变化
  @override
  void didChangeDependencies() {
    context.read<ThemeProvider>().systemDarkModeChange();
    super.didChangeDependencies();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/pages/home_tab/tab_home_page.dart';
import 'package:lx_base/lx_state.dart';

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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          TabHomePage(),
          Container(
            child: Text("222"),
          ),
          Container(
            child: Text("333"),
          ),
          Container(
            child: Text("444"),
          ),
        ],
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
}

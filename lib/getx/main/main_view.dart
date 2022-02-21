import 'package:flutter/material.dart';
import 'package:flutter_wan_android/generated/l10n.dart';
import 'package:flutter_wan_android/getx/abs_list/lx_page.dart';
import 'package:flutter_wan_android/getx/home/home_view.dart';
import 'package:flutter_wan_android/getx/qa/qa_view.dart';
import 'package:flutter_wan_android/getx/tree/tree_view.dart';
import 'package:get/get.dart';

import '../profile/profile_view.dart';
import 'main_logic.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MainLogic());
    final state = logic.state;

    final PageController _pageController = PageController();

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          state.currentIndex.value = index;
        },
        children: [
          LxPage(HomePage()),
          LxPage(QaPage()),
          LxPage(TreePage()),
          LxPage(ProfilePage())
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: [
            _buildBottomTabItem(Icons.home, S.of(context).bottom_tab_home),
            _buildBottomTabItem(Icons.comment, S.of(context).bottom_tab_qa),
            _buildBottomTabItem(
                Icons.local_library, S.of(context).bottom_tab_tree),
            _buildBottomTabItem(Icons.face, S.of(context).bottom_tab_profile),
          ],
          onTap: (index) {
            state.currentIndex.value = index;
            _pageController.jumpToPage(index);
          },
          currentIndex: state.currentIndex.value,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
        );
      }),
    );
  }

  BottomNavigationBarItem _buildBottomTabItem(IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(icon), activeIcon: Icon(icon), label: label);
  }
}

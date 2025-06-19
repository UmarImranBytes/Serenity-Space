import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serenity_space/app_module/chat/view/chat_pre_screen.dart';
import 'package:serenity_space/app_module/chat/view/chat_screen.dart';
import 'package:serenity_space/app_module/consultant/consultant_list_screen.dart';
import 'package:serenity_space/app_module/home/home_screen.dart';
import 'package:serenity_space/app_module/setting/setting_screen.dart';
import 'navbar_item.dart';

import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}

class NavigationScreen extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> children = [
    AiScreen(),
    HomeScreen(),
    ConsultantScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: children[navController.currentIndex.value],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon:  Icons.smart_toy,
              label: 'AI',
              index: 0,
              currentIndex: navController.currentIndex.value,
              onTap: navController.changeTab,
            ),
            BottomNavItem(
              icon: CupertinoIcons.speaker_3_fill,
              label: 'Sounds',
              index: 1,
              currentIndex: navController.currentIndex.value,
              onTap: navController.changeTab,
            ),
            BottomNavItem(
              icon: CupertinoIcons.person_2_fill,
              label: 'Consultant',
              index: 2,
              currentIndex: navController.currentIndex.value,
              onTap: navController.changeTab,
            ),
            BottomNavItem(
              icon: Icons.settings,
              label: 'Setting',
              index: 3,
              currentIndex: navController.currentIndex.value,
              onTap: navController.changeTab,
            ),


          ],
        ),
      ),
    ));
  }
}


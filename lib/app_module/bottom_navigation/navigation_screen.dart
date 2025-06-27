import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serenity_space/app_module/chat/view/chat_pre_screen.dart';
import 'package:serenity_space/app_module/chat/view/chat_screen.dart';
import 'package:serenity_space/app_module/consultant/consultant_list_screen.dart';
import 'package:serenity_space/app_module/home/home_screen.dart';
import 'package:serenity_space/app_module/setting/setting_screen.dart';
import 'package:serenity_space/app_module/activities/activities_screen.dart';
import 'navbar_item.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;
  void changeTab(int index) {
    currentIndex.value = index;
  }
}

class NavigationScreen extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> pages = [
    AiScreen(),
    HomeScreen(),
    ActivitiesScreen(),
    ConsultantScreen(),
    SettingScreen(),
  ];

  final List<IconData> icons = [
    Icons.smart_toy,
    CupertinoIcons.speaker_3_fill,
    Icons.self_improvement,
    CupertinoIcons.person_2_fill,
    Icons.settings,
  ];

  final List<String> labels = [
    'AI',
    'Self Care',
    'Activities',
    'Consultants',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[navController.currentIndex.value],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navController.changeTab(2), // FAB opens Activities
        backgroundColor: Colors.teal,
        child: const Icon(Icons.self_improvement),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(labels.length, (index) {
              // Skip center index to leave space for FAB
              if (index == 2) return const SizedBox(width: 60);
              return BottomNavItem(
                icon: icons[index],
                label: labels[index],
                index: index,
                currentIndex: navController.currentIndex.value,
                onTap: navController.changeTab,
              );
            }),
          ),
        ),
      ),
    ));
  }
}

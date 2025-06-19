import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serenity_space/app_module/home/widget/card.dart';
import 'package:serenity_space/widegts/custom_size_box_widget/custom_sized_box.dart';
import '../../utils/app_color/app_color.dart';
import '../../utils/constant/app_image_constant.dart';
import '../../utils/constant/string_constant.dart';
import '../../utils/fonts/app_fonts.dart';
import '../../widegts/animation/animation.dart';
import '../../widegts/app_text/textwidget.dart';
import '../auth/view/login_screen.dart';
import '../chat/view/chat_screen.dart';
import 'controller/home_controller.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E97E8), // Start color
              Color(0xFF9BF2B1), // End color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 50),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "What do you want to reduce?",
                  fSize: 17,
                  fWeight: FontWeights.semiBold,
                  textColor: AppColors.white,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.mediaList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final item = controller.mediaList[index];
                      return MediaCardWidget(
                        imagePath: item['image']!,
                        name: item['name']!,
                        time: item['time']!,
                        audioPath: item['audio']!,
                        backgroundColor: AppColors.mutedElements,
                      );
                    },
                  ),
                ),
              ],
            ),

            );
          },
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // // TODO: Add your AI feature navigation or function here
      //     // Get.snackbar("AI Assistant", "Coming Soon!", snackPosition: SnackPosition.BOTTOM);
      //     Get.to(ChatScreen());
      //   },
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     Icons.smart_toy, // AI-looking icon
      //     color: AppColors.primaryAppBar, // Your theme color
      //     size: 28,
      //   ),
      // ),

    );
  }
}

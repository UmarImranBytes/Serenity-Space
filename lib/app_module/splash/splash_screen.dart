import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serenity_space/widegts/custom_size_box_widget/custom_sized_box.dart';
import '../../utils/constant/app_image_constant.dart';
import '../../utils/constant/string_constant.dart';
import '../../utils/fonts/app_fonts.dart';
import '../../widegts/animation/animation.dart';
import '../../widegts/app_text/textwidget.dart';
import '../auth/controller/auth_controller.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final  AuthController controller = Get.find();
  @override
  void initState() {
    super.initState();
    start();
  }
  void start() async {
    await Future.delayed(const Duration(seconds: 5));
    controller.checkLoginStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  90.sbh,
                  CustomAnimated(
                    tween: Tween<Offset>(
                        begin: const Offset(0, -1), end: const Offset(0, 0)),
                    curve: Curves.bounceOut,
                    duration: const Duration(seconds: 4),
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        AppImages.logo,
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.3,
                      ),
                    ),
                  ),

                 
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:serenity_space/widegts/custom_size_box_widget/custom_sized_box.dart';
import '../../utils/app_color/app_color.dart';
import '../../utils/constant/app_image_constant.dart';
import '../../utils/constant/string_constant.dart';
import '../../utils/fonts/app_fonts.dart';
import '../../widegts/animation/animation.dart';
import '../../widegts/app_button/custum_button.dart';
import '../../widegts/app_text/rich_text_widget.dart';
import '../../widegts/app_text/textwidget.dart';
import '../auth/view/login_screen.dart';
class GetStart extends StatelessWidget {
  const GetStart({super.key});

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

            return SizedBox(
              height: screenHeight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    90.sbh,
                    CustomAnimated(
                      tween: Tween<Offset>(
                          begin: const Offset(0, -1), end: const Offset(0, 0)),
                      curve: Curves.easeInOutCubicEmphasized,
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
                    10.sbh,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomAnimated(
                        beginX: 0.0,
                        beginY: 1.0,
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 2),
                        tween: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: const Offset(0, 0),
                        ),
                        alignment: Alignment.center,
                        child: TextWidget(
                          text: MyText.appName,
                          fSize: 20,
                          align: TextAlign.center,
                          fWeight: FontWeights.medium,
                        ),
                      ),
                    ),
                    100.sbh,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomAnimated(
                        beginX: 0.0,
                        beginY: 1.0,
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 2),
                        tween: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: const Offset(0, 0),
                        ),
                        alignment: Alignment.center,
                        child: RichTextWidget(
                          fSize: 25,
                          fWeight: FontWeight.normal,
                          textColor: AppColors.jetBlack,
                          overFlow: true,
                          maxLine: 2,
                          textSpans: [
                            const TextSpan(text: "Hey! I'm "),
                            TextSpan(
                              text: 'Serenity',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )

                      ),
                    ),
                    80.sbh,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomAnimated(
                        beginX: 0.0,
                        beginY: 1.0,
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 2),
                        tween: Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: const Offset(0, 0),
                        ),
                        alignment: Alignment.center,
                        child: TextWidget(
                          text: MyText.getStartText,
                          fSize: 18,
                          align: TextAlign.center,
                          fWeight: FontWeights.semiBold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: CustomElevatedButton(
                        text: MyText.getStart,
                        backgroundColor: AppColors.primaryAppBar,
                        width: screenWidth * 0.7,
                        height: screenHeight * 0.07,
                        fontSize: 20.sp,
                        borderRadius: 50,
                        fontWeight: FontWeights.semiBold,
                        onPressed: () {
                         Get.offAll(LogInScreen());
                        },
                      ),
                    ),
                    15.sbh,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}

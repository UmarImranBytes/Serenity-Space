import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:serenity_space/app_module/auth/controller/auth_controller.dart';
import 'package:serenity_space/app_module/auth/view/sign_up_screen.dart';
import 'package:serenity_space/widegts/custom_size_box_widget/custom_sized_box.dart';

import '../../../utils/app_color/app_color.dart';
import '../../../utils/constant/app_image_constant.dart';
import '../../../utils/constant/string_constant.dart';
import '../../../utils/fonts/app_fonts.dart';
import '../../../widegts/animation/animation.dart';
import '../../../widegts/app_button/custum_button.dart';
import '../../../widegts/app_text/rich_text_widget.dart';
import '../../../widegts/app_text/textwidget.dart';
import '../../../widegts/app_text_field/app_text_Field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final  AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: controller.forgetKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      40.sbh,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(onPressed: (){
                          Get.back();
                        }, icon: Icon(Icons.arrow_back_ios)),
                      ),
                      30.sbh,
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
                          curve: Curves.easeInOutCubicEmphasized,
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
                            textColor: Colors.amber,
                          ),
                        ),
                      ),
                      60.sbh,
                      TextWidget(
                        text: "Forget Password",
                        fSize: 30,
                        align: TextAlign.center,
                        fWeight: FontWeights.semiBold,
                        textColor: AppColors.white,
                      ),

                      25.sbh,
                      CustomTextField(
                        controller: controller.email,
                        hintText: 'example@gmail.com',
                        hintColor: AppColors.white,

                        borderRadius: 30,
                        bgColor: AppColors.primaryAppBar,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!GetUtils.isEmail(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),

                      20.sbh,
                      Material(
                        color: Colors.transparent,
                        child: CustomElevatedButton(
                          text: "Forget Password",
                          backgroundColor: AppColors.primaryAppBar,
                          // width: screenWidth * 0.7,
                          height: screenHeight * 0.06,
                          fontSize: 20.sp,
                          borderRadius: 50,
                          fontWeight: FontWeights.semiBold,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.forgotPassword(); // Call login only if validation passes
                            }
                          },
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

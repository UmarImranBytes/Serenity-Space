import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:serenity_space/app_module/auth/controller/auth_controller.dart';
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
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
                  key: controller.signKey,
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
                        text: "Create New\nAccount",
                        fSize: 30,
                        align: TextAlign.center,
                        fWeight: FontWeights.semiBold,
                        textColor: AppColors.jetBlack,
                      ),
                      25.sbh,
                      CustomTextField(
                        controller: controller.name,
                        hintText: 'Name',
                        hintColor: AppColors.white,
                        borderRadius: 30,
                        bgColor: AppColors.primaryAppBar,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Name is required';
                          } else if (value.trim().length < 2) {
                            return 'Name must be at least 2 characters';
                          }
                          return null;
                        },
                      ),

                      10.sbh,
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
                      10.sbh,
                      CustomTextField(
                        controller: controller.password,
                        hintText: 'Enter your password',
                        hintColor: AppColors.white,
                        borderRadius: 30,
                        bgColor: AppColors.primaryAppBar,
                      //  obscureText: true, // Hides the password input
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      20.sbh,
                      Material(
                        color: Colors.transparent,
                        child: CustomElevatedButton(
                          text: MyText.signUp,
                          backgroundColor: AppColors.primaryAppBar,
                          // width: screenWidth * 0.7,
                          height: screenHeight * 0.06,
                          fontSize: 20.sp,
                          borderRadius: 50,
                          fontWeight: FontWeights.semiBold,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.signUp();
                            }
                          },
                        ),
                      ),

                      30.sbh,
                      //const Spacer(),
                      CustomAnimated(
                          beginX: 0.0,
                          beginY: 1.0,
                          curve: Curves.easeInOut,
                          duration: const Duration(seconds: 2),
                          tween: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: const Offset(0, 0),
                          ),
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: (){
                              Get.to(LogInScreen());
                            },
                            child: RichTextWidget(
                              fSize: 15,
                              fWeight: FontWeight.normal,
                              textColor: AppColors.jetBlack,
                              overFlow: true,
                              maxLine: 2,
                              textSpans: [
                                const TextSpan(text: "Already have an account! "),
                                TextSpan(
                                  text: 'Sign In',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )

                      ),
                      15.sbh,
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

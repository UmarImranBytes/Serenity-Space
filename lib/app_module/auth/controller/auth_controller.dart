import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:serenity_space/app_module/bottom_navigation/navigation_screen.dart';

import '../../../utils/app_color/app_color.dart';
import '../../../widegts/loader/app_loader.dart';
import '../../get_start/get_start.dart';
import '../../home/home_screen.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login Function
  Future<void> login() async {
    try {
      if (formKey.currentState!.validate()) {
        // Start a loading indicator or process
        Get.dialog(
          Center(child: customLoader(AppColors.primaryAppBar)),
          barrierDismissible: false,
        );

        // Sign in the user with email and password
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        Get.back(); // Close the loading dialog

        // Check if login is successful
        if (userCredential.user != null) {
          Get.snackbar('Success', 'Login successful', snackPosition: SnackPosition.BOTTOM);
          Get.offAll(NavigationScreen());
        }
      }
    } catch (e) {
      Get.back(); // Close the loading dialog
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Sign Up Function
  Future<void> signUp() async {
    try {
      if (formKey.currentState!.validate()) {
        Get.dialog(
           Center(child: customLoader(AppColors.primaryAppBar)),
          barrierDismissible: false,
        );

        // Create a new user with email and password
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        Get.back(); // Close the loading dialog

        // Check if sign-up is successful
        if (userCredential.user != null) {
          Get.snackbar('Success', 'Sign-up successful', snackPosition: SnackPosition.BOTTOM);
          Get.offAll(NavigationScreen());
        }
      }
    } catch (e) {
      Get.back(); // Close the loading dialog
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Forgot Password Function
  Future<void> forgotPassword() async {
    try {
      if (email.text.trim().isEmpty) {
        Get.snackbar('Error', 'Please enter your email', snackPosition: SnackPosition.BOTTOM);
        return;
      }

      Get.dialog(
         Center(child: customLoader(AppColors.primaryAppBar)),
        barrierDismissible: false,
      );

      // Send password reset email
      await _auth.sendPasswordResetEmail(email: email.text.trim());

      Get.back(); // Close the loading dialog
      Get.snackbar('Success', 'Password reset link sent to your email', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.back(); // Close the loading dialog
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void checkLoginStatus() {
    User? user = _auth.currentUser;

    if (user != null) {
      Get.offAll(NavigationScreen());
    } else {
      Get.offAll(GetStart());
    }
  }
}

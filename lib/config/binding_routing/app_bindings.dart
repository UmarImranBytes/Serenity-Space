import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../app_module/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint('========================= AuthBinding =======================');
    Get.lazyPut<AuthController>(() => AuthController());


  }
}

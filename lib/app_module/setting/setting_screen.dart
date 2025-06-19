import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:serenity_space/utils/app_color/app_color.dart';
import '../auth/view/login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LogInScreen()); // Replace with your login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E97E8),
              Color(0xFF9BF2B1),
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ListTile(
                    leading: const Icon(Icons.account_circle, color: Colors.white),
                    title: const Text('Account', style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onTap: () {
                      // Navigate to account settings screen (optional)
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications, color: Colors.white),
                    title: const Text('Notifications', style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onTap: () {
                      // Navigate to notifications screen (optional)
                    },
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: _signOut,
                    icon: const Icon(Icons.logout),
                    label: const Text('Sign Out'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryAppBar,
                      foregroundColor: Colors.white,
                      minimumSize: Size(screenWidth * 0.6, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
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

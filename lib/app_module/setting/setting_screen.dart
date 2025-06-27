import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:serenity_space/utils/app_color/app_color.dart';
import '../auth/view/login_screen.dart';

// Screens
import 'view/account_screen.dart';
import 'view/notification_screen.dart';
import 'view/privacy_screen.dart';
import 'view/support_screen.dart';
import 'view/about_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LogInScreen());
  }

  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E97E8), Color(0xFF9BF2B1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 32, 16, 16),
        child: Column(
          children: [
            _buildSettingsOption(
              icon: Icons.person,
              title: 'Account',
              onTap: () => Get.to(() => const AccountScreen()),
            ),
            _buildSettingsOption(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () => Get.to(() => const NotificationsScreen()),
            ),
            _buildSettingsOption(
              icon: Icons.lock,
              title: 'Privacy & Security',
              onTap: () => Get.to(() => const PrivacyScreen()),
            ),
            _buildSettingsOption(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () => Get.to(() => const SupportScreen()),
            ),
            _buildSettingsOption(
              icon: Icons.info_outline,
              title: 'About App',
              onTap: () => Get.to(() => const AboutScreen()),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _signOut,
              icon: const Icon(Icons.logout),
              label: const Text("Sign Out"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryAppBar,
                foregroundColor: Colors.white,
                minimumSize: Size(Get.width * 0.6, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

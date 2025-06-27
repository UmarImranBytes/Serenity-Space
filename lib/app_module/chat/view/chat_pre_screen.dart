import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serenity_space/app_module/chat/view/chat_screen.dart';
import 'package:serenity_space/utils/app_color/app_color.dart';
import 'package:serenity_space/utils/fonts/app_fonts.dart';
import 'package:serenity_space/widegts/app_text/textwidget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../activities/activities_screen.dart';

class AiScreen extends StatelessWidget {
  AiScreen({super.key});

  void _launchWhatsApp() async {
    String phoneNumber = "923174689617";
    String message = Uri.encodeComponent("Serenity Space! How can I help you!");
    _launchUrl("https://wa.me/$phoneNumber?text=$message");
  }

  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Donation card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextWidget(
                          text: 'Support our Mission\nBuy us a Coffee ☕',
                          fSize: 18,
                          fWeight: FontWeights.bold,
                          textColor: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _launchUrl('mailto:iumar4770@gmail.com'),
                        icon: const Icon(Icons.coffee, color: Colors.white, size: 40),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // AI Introduction Text
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextWidget(
                    text: 'Serenity Space: A Smarter Space for a Healthier Mind.\n\nYour AI-powered mental health companion for clarity and calm. 🌿',
                    fSize: 16,
                    align: TextAlign.center,
                    fWeight: FontWeights.medium,
                    textColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),

                // Serenity Chat Card
                GestureDetector(
                  onTap: () => Get.to(() => ChatScreen()),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryAppBar,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.smart_toy, color: Colors.white, size: 28),
                        const SizedBox(width: 10),
                        TextWidget(
                          text: 'Chat with Serenity AI',
                          fSize: 16,
                          fWeight: FontWeights.bold,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Wellness Activities Card
                GestureDetector(
                  onTap: () => Get.to(() => ActivitiesScreen()),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.self_improvement, color: Colors.teal, size: 28),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Explore Wellness Activities',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
                      ],
                    ),
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

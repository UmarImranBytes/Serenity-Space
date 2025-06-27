import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_color/app_color.dart';
import '../../widegts/app_text/app_text.dart';
import 'consultant_list_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultantDetailScreen extends StatelessWidget {
  final Consultant consultant;

  ConsultantDetailScreen({super.key, required this.consultant});

  void _launchWhatsApp() async {
    String phoneNumber = "923174689617";
    String message = Uri.encodeComponent("Wealth Wise! How can I help you?");
    _launchUrl("https://wa.me/$phoneNumber?text=$message");
  }

  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                const SizedBox(height: 12),
                AppText(
                  text: 'Consultant Profile',
                  size: 26,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryAppBar,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.person, size: 40, color: Colors.blue),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              consultant.name,
                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(consultant.type, style: const TextStyle(color: Colors.white70)),
                            Row(
                              children: List.generate(
                                consultant.rating.floor(),
                                    (i) => const Icon(Icons.star, color: Colors.orange, size: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _launchUrl('mailto:iumar4770@gmail.com'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: const Text('Email'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryAppBar,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "About Consultant",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      AppText(
                        text: consultant.about,
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 20),
                      AppText(
                        text: "Available Slot",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      AppText(
                        text: consultant.availableSlots,
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _launchWhatsApp,
                        icon: const Icon(Icons.chat),
                        label: const Text("Chat on WhatsApp"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(50),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () => _launchUrl('mailto:iumar4770@gmail.com'),
                        icon: const Icon(Icons.calendar_today),
                        label: const Text("Book a Session"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

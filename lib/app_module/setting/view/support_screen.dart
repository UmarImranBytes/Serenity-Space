import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  void _launchEmail() async {
    final email = Uri.encodeFull("support@serenityspace.com");
    final subject = Uri.encodeFull("Help Request - Serenity Space");
    final body = Uri.encodeFull("Hi Team,\n\nI need help with...");

    final uri = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchWhatsApp() async {
    const phone = "923174689617";
    const message = "Hello, I need help with the Serenity Space app.";
    final url = Uri.parse("https://wa.me/$phone?text=${Uri.encodeFull(message)}");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Widget _buildHelpTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16))),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFaq() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Frequently Asked Questions",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "• How do I book a session?\n"
              "• How do I reset my password?\n"
              "• How do I contact a consultant?\n",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 32, 16, 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E97E8), Color(0xFF9BF2B1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Need assistance? Reach out to us:",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildHelpTile(
              icon: Icons.email_outlined,
              title: "Email Us",
              onTap: _launchEmail,
            ),
            _buildHelpTile(
              icon: Icons.chat_bubble_outline,
              title: "WhatsApp Support",
              onTap: _launchWhatsApp,
            ),
            const SizedBox(height: 30),
            _buildFaq(),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serenity_space/app_module/chat/view/chat_screen.dart';
import 'package:serenity_space/app_module/home/widget/card.dart';
import 'package:serenity_space/utils/app_color/app_color.dart';
import 'package:serenity_space/utils/constant/string_constant.dart';
import 'package:serenity_space/utils/fonts/app_fonts.dart';
import 'package:serenity_space/widegts/app_text/app_text.dart';
import 'package:serenity_space/widegts/app_text/textwidget.dart';
import 'package:serenity_space/widegts/custom_size_box_widget/custom_sized_box.dart';
import 'package:url_launcher/url_launcher.dart';
class AiScreen extends StatelessWidget {
  AiScreen({super.key});
  void _launchWhatsApp() async {

    String phoneNumber = "923174689617"; // Replace with your number
    String message = Uri.encodeComponent("Serenity Space! How i can help you!");
    _launchUrl("https://wa.me/$phoneNumber?text=$message");
  }
  void _launchUrl(String mail) async {
    if (!await launchUrl(Uri.parse(mail))) throw 'Could not launch $mail';
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

            return Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 50),
child:  Column(
  children: [
    SizedBox(height: 12),

    Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryAppBar,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: 'As we work free for you\nBuy us a Coffee',size: 18,fontWeight: FontWeight.bold,color: Colors.white),

          IconButton( onPressed: () {
    _launchUrl('mailto:iumar4770@gmail.com');
    }, icon: const Icon(Icons.coffee,color: Colors.white,size: 40,)),



        ],
      ),
    ),
    SizedBox(height: Get.height*0.15),
    TextWidget(
      text: 'Serenity Space: A Smarter Space for a Healthier Mind \n An AI-powered chatbot helping users find clarity and calm.',
      fSize: 16,
      align: TextAlign.center,
      fWeight: FontWeights.medium,
      textColor: Colors.white,
    ),
    SizedBox(height: Get.height*0.025),
    GestureDetector(
      onTap: (){
        Get.to(ChatScreen());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primaryAppBar,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: 'Click Here to chat with Serenity AI',
              fSize: 14,
              align: TextAlign.center,
              fWeight: FontWeights.medium,
            ),
            IconButton( onPressed: () {

            }, icon: const Icon(Icons.smart_toy,color: Colors.white,size: 25,)),
          ],
        ),
      ),
    ),

    Spacer(),

  ],
),

            );
          },
        ),
      ),



    );
  }
}

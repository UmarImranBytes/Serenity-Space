import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serenity_space/app_module/home/widget/card.dart';
import 'package:serenity_space/widegts/custom_size_box_widget/custom_sized_box.dart';
import '../../utils/app_color/app_color.dart';
import '../../utils/fonts/app_fonts.dart';
import '../../widegts/animation/animation.dart';
import '../../widegts/app_text/textwidget.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Serenity Space",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E97E8), Color(0xFF9BF2B1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAnimated(
                tween: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: Offset.zero,
                ),
                duration: const Duration(milliseconds: 800),
                child: TextWidget(
                  text: "What do you want to reduce?",
                  fSize: 20,
                  fWeight: FontWeights.bold,
                  textColor: Colors.white,
                ),
              ),
              16.sbh,
              Expanded(
                child: GridView.builder(
                  itemCount: controller.mediaList.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.mediaList[index];
                    return CustomAnimated(
                      tween: Tween<Offset>(
                        begin: Offset(0, 0.3 * (index % 2 == 0 ? 1 : -1)),
                        end: Offset.zero,
                      ),
                      duration: Duration(milliseconds: 600 + index * 100),
                      child: MediaCardWidget(
                        imagePath: item['image']!,
                        name: item['name']!,
                        time: item['time']!,
                        backgroundColor: Colors.white.withOpacity(0.9),
                        audioTracks: List<String>.from(item['audioTracks']),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

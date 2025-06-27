import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../utils/constant/app_image_constant.dart';
import '../../utils/constant/string_constant.dart';
import '../auth/controller/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final AuthController controller = Get.find();
  Color bgColor = Colors.white;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startSplashFlow();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  Future<void> _startSplashFlow() async {
    await _extractColorFromImage();
    await Future.delayed(const Duration(seconds: 4));
    controller.checkLoginStatus();
  }

  Future<void> _extractColorFromImage() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(AppImages.logo),
    );
    setState(() {
      bgColor = generator.dominantColor?.color ?? Colors.white;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Glowing logo shimmer
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    AppImages.logo,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // App Name
              Text(
                MyText.appName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.95),
                  letterSpacing: 1.2,
                ),
              ),

              // Tagline
              const SizedBox(height: 8),
              Text(
                MyText.tagline,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Views/Auth/login_screem.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX navigation after delay
    Future.delayed(const Duration(seconds: 8), () {
      Get.offAll(() => LoginScreen()); // Proper GetX navigation
    });

    return Scaffold(
      backgroundColor: const Color(0xFFBBD1FF),
      body: Center(
        child: Image.asset("assets/common/logo.png"),
      ),
    );
  }
}

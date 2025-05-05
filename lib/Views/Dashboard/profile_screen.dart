import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Custom/bottomnavy.dart';
import 'package:result_nepal/Views/Dashboard/homeScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();  // Go back to HomeScreen
          },
        ),
        title: const Text("Profile"),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          if (index == 0) {
            Get.to(() => HomeScreen()); // Go back to HomeScreen when tapped
          }
        },
      ),
      body: const Center(child: Text("Profile Content")),
    );
  }
}

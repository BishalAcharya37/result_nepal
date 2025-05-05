import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Views/Auth/login_screem.dart';
import 'package:result_nepal/Views/Auth/splash_screen.dart';
import 'package:result_nepal/Views/Dashboard/detail_screen.dart';
import 'package:result_nepal/Views/Dashboard/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Changed from MaterialApp
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

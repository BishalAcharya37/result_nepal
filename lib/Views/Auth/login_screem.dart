import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Views/Auth/RegisterScreen.dart';
import 'package:result_nepal/Views/Auth/forget_screen.dart';
import 'package:result_nepal/Views/Dashboard/homeScreen.dart';
import 'package:result_nepal/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final RxBool obscureText = true.obs;

  // Define a base TextStyle with Poppins font
  TextStyle get poppinsTextStyle => const TextStyle(
        fontFamily: 'Poppins', // Ensure this matches pubspec.yaml
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Logo
              Image.asset(
                "assets/common/logo.png",
                height: 150,
              ),
              // Login Text
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15),
                child: Row(
                  children: [
                    Text(
                      "Login",
                      style: poppinsTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Username",
                style: poppinsTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Username/Email Field
              TextField(
                style: poppinsTextStyle, // Apply Poppins to input text
                decoration: InputDecoration(
                  hintText: "Username or Email",
                  hintStyle: poppinsTextStyle, // Apply Poppins to hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Text(
                "Password",
                style: poppinsTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Obx(
                () => TextField(
                  style: poppinsTextStyle,
                  obscureText: obscureText.value,
                  decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: poppinsTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        obscureText.toggle();
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(height: 10),
              // Forgot Password with Underline
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Get.to(() => ForgetScreen()); // Replace with your screen
                  },
                  child: Text(
                    "Forgot Password?",
                    style: poppinsTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    "Sign In",
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Alternative Login Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: poppinsTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => RegisterScreen());
                    },
                    child: Text(
                      "  Sign up",
                      style: poppinsTextStyle.copyWith(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

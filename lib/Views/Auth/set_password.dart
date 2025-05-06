import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Views/Auth/login_screem.dart';
import 'package:result_nepal/Views/Auth/reset_successfull.dart';
import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class Setpassword extends StatelessWidget {
  Setpassword({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and app name
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/common/logo.png",
                    height: 100,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Result Nepal",
                    style: CustomTextStyles.f24W600(color: AppColors.buttonColor),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Set a new password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Create a new password. Ensure it differs from previous one for the security",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),

              // New Password
              const Text("New Password"),
              Obx(
                () => TextField(
                  controller: passwordController,
                  obscureText: obscurePassword.value,
                  decoration: InputDecoration(
                    hintText: "Enter new password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        obscurePassword.toggle();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Confirm Password
              const Text("Confirm New Password"),
              Obx(
                () => TextField(
                  controller: confirmPasswordController,
                  obscureText: obscureConfirmPassword.value,
                  decoration: InputDecoration(
                    hintText: "Re-enter new password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirmPassword.value ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        obscureConfirmPassword.toggle();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Reset Password Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Optionally: Add validation logic here
                    Get.to(() => ResetSuccessfull());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Back to Login
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: const Text(
                    "Back to Login Page",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

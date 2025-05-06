import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Custom/elevated_button.dart';
import 'package:result_nepal/Views/Auth/login_screem.dart';
import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class ResetSuccessfull extends StatelessWidget {
  const ResetSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and Text Row
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
                    style:
                        CustomTextStyles.f24W600(color: AppColors.buttonColor),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Tick Icon in Circle - Centered
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.buttonColor,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Success Text - Centered
              const Center(
                child: Text(
                  "Successful!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Description Text
              Center(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Congratulations! Your password has been\n successfully changed. Press continue to \n log in with your new password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                  title: 'Continue',
                  onTap: () {
                    Get.offAll(LoginScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:result_nepal/Views/Auth/login_screem.dart';
import 'package:result_nepal/Views/Auth/set_password.dart';
import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class Otp extends StatelessWidget {
  Otp({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Confirm Otp",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Please check your inbox and enter 6 digit OTP",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Center(
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    textStyle: const TextStyle(color: Colors.black),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(40),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      selectedColor: AppColors.primaryColor,
                      inactiveColor: AppColors.lGrey,
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (value) {},
                    onChanged: (value) {
                      print("Changed: $value");
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => Setpassword());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color(0xFF1D4ED8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get a code?",
                    style: CustomTextStyles.f16W600(),
                  ),
                  InkWell(
                    onTap: () {
                      // Retry logic here
                    },
                    child: Text(
                      "Try another way",
                      style: CustomTextStyles.f16W600(),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
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

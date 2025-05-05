import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Custom/custom_textfield.dart';
import 'package:result_nepal/Views/Auth/login_screem.dart';
import 'package:result_nepal/custom/elevated_button.dart';

class RegisterController extends GetxController {
  final passwordObscure = true.obs;
  final confirmPasswordObscure = true.obs;

  void togglePasswordVisibility() => passwordObscure.toggle();
  void toggleConfirmPasswordVisibility() => confirmPasswordObscure.toggle();
}

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/common/logo.png',
                  height: 100,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Create New Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),

              // Full Name
              const Text('Full Name',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Enter your full name',
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Email Address
              const Text('Email Address',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Address
              const Text('Address',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Enter your address',
                textInputType: TextInputType.streetAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Password
              const Text('Password',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Obx(() => CustomTextField(
                    hint: 'Create a password',
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    obscureText: controller.passwordObscure.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.passwordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  )),
              const SizedBox(height: 16),

              // Confirm Password
              const Text('Confirm Password',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Obx(() => CustomTextField(
                    hint: 'Re-enter your password',
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: controller.confirmPasswordObscure.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.confirmPasswordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                  )),
              const SizedBox(height: 30),

              // Register Button
              CustomElevatedButton(
                title: 'Register Now',
                onTap: () => Get.to(() => LoginScreen()),
              ),
              const SizedBox(height: 20),

              // Login Link
              Center(
                child: TextButton(
                  onPressed: () => Get.to(() => LoginScreen()),
                  child: const Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      children: [
                        TextSpan(
                          text: 'Login Now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

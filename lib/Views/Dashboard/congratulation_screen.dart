import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:result_nepal/Custom/elevated_button.dart';
import 'package:result_nepal/Views/Dashboard/homeScreen.dart';
import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Optional: center the column
          Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset('assets/common/congratulation.png'),
            SizedBox(height: 20),
            Text(
              'Santoshi Adhikari',
              style: CustomTextStyles.f24W600(color: AppColors.buttonColor),
            ),
            Image.asset('assets/common/fireworks.png'),
            Image.asset('assets/common/label.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/common/peep1.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/common/peep2.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            SizedBox(height: 200),
            CustomElevatedButton(
                title: 'Back to Home',
                onTap: () {
                  Get.offAll(HomeScreen());
                }),
            SizedBox(
              height: 10,
            ),
            CustomElevatedButton(title: 'View Report Via DOB', onTap: () {})
          ],
        ),
      ),
    );
  }
}

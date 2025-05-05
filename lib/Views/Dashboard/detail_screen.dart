import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Custom/elevated_button.dart';
import 'package:result_nepal/Views/Dashboard/congratulation_screen.dart';
import 'package:result_nepal/Views/Dashboard/homeScreen.dart';
import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  // Date picker logic (to show a date picker when tapped on the DOB field)
  Future<void> _selectDOB(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null) {
      // You can set the selected date back into the text field if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back to Home",
          style: CustomTextStyles.f24W600(color: AppColors.buttonColor),
        ),
        leading: IconButton(
          onPressed: () {
            Get.offAll(HomeScreen()); // Going back to the previous screen
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 33,
          ),
          color: AppColors.buttonColor,
        ),
        elevation: 0,
        titleSpacing: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text "SEE Result / Via Symbol Number & DOB"
              Text(
                "SEE Result / Via Symbol Number & DOB",
                style: CustomTextStyles.f18W600(color: AppColors.buttonColor),
              ),
              SizedBox(height: 20),

              Text(
                "Enter Your Symbol Number",
                style: CustomTextStyles.f18W600(color: AppColors.buttonColor),
              ),
              SizedBox(height: 10), // Space between title and the date picker
              // Space between title and the text fields

              // TextFormField for symbol number
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'e.g. 1234567890F',
                  hintStyle: TextStyle(color: Colors.grey), // Grey hint text

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.buttonColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.buttonColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 20), // Space between form fields

              // Text "DOB"
              Text(
                "DOB",
                style: CustomTextStyles.f18W600(color: AppColors.buttonColor),
              ),
              SizedBox(height: 10), // Space between title and the date picker

              // GestureDetector for DOB field (to show date picker)
              GestureDetector(
                onTap: () {
                  _selectDOB(context); // Open date picker on tap
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'YYYY/MM/DD',
                      hintStyle:
                          TextStyle(color: Colors.grey), // Grey hint text

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.buttonColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.buttonColor, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 500),
              CustomElevatedButton(
                  title: 'Proceed',
                  onTap: () {
                    Get.to(CongratulationScreen());
                  }) // Space after DOB field
            ],
          ),
        ),
      ),
    );
  }
}

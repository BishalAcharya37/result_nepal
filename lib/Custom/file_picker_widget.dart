import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class FilePickerWidget extends StatelessWidget {
  final String label;
  final String hint;
  final String fileType;
  final RxString selectedFilePath; // RxString to hold the selected file path

  FilePickerWidget({
    Key? key,
    required this.label,
    required this.hint,
    required this.fileType,
    required this.selectedFilePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Text
        Row(
          children: [
            Text(
              label,
              style: CustomTextStyles.f14W400(
                  // Button color in light mode
                  ),
            ),
            Text(
              ' *',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 8),

        // Row containing the text field and the button
        Row(
          children: [
            // Container for the text field
            Container(
              decoration: BoxDecoration(
                // Slightly off-white background in light mode
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    // Darker border in light mode
                    ),
              ),
              width: 180,
              // Set a fixed width for the text field box
              child: TextFormField(
                style: TextStyle(
                    // Black text in light mode
                    ),
                readOnly: true,
                controller: TextEditingController(
                  text: selectedFilePath.value.isEmpty
                      ? hint // Default text
                      : selectedFilePath.value, // File path text
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey), // Hint text
                  border: InputBorder.none, // No border within the text field
                  filled: true,
                  // Background color depending on mode
                ),
              ),
            ),
            SizedBox(width: 8), // Space between the text field and the button

            // Elevated button outside the box, but in the same line
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                width: 1.0,
              ) // Use app's button color in light mode
                  ),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: fileType == 'video'
                      ? FileType
                          .video // Pick video files if fileType is 'video'
                      : FileType
                          .image, // Pick image files if fileType is 'photo'
                );
                if (result != null && result.files.isNotEmpty) {
                  selectedFilePath.value = result.files.single.path ?? '';
                }
              },
              child: Text(
                'Choose File',
                style: TextStyle(
                    // Black text on the button in light mode
                    ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

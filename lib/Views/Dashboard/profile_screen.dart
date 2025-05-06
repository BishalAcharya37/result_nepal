import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:result_nepal/Custom/elevated_button.dart';
import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyImageUrl =
        "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
        title: Text("Profile",
            style: CustomTextStyles.f18W600(color: Colors.blue)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor.withOpacity(0.85),
                    const Color.fromARGB(255, 52, 53, 66).withOpacity(0.65),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Edit Icon (does nothing now)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // No action
                      },
                    ),
                  ),

                  // Profile Picture and Name
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: CachedNetworkImage(
                            imageUrl: dummyImageUrl,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.network(
                              dummyImageUrl,
                              height: 75,
                              width: 75,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // List Items (now static)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildListTile(
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy Policy",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.help_outline,
                    title: "FAQ",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.description_outlined,
                    title: "Terms & Conditions",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Contact Us Section
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Contact Us",
                    style:
                        CustomTextStyles.f16W600(color: AppColors.primaryColor),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: AppColors.primaryColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Location: Srijana Chowk, Pokhara",
                          style: CustomTextStyles.f14W400(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.call, color: AppColors.primaryColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Contact No: 9864430493",
                          style: CustomTextStyles.f14W400(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.email, color: AppColors.primaryColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Email: support@resultnepal.com",
                          style: CustomTextStyles.f14W400(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Logout Button (no actual logout functionality)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomElevatedButton(
                title: "Logout",
                onTap: () {
                  // No action
                },
                textColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,
      ),
    );
  }
}

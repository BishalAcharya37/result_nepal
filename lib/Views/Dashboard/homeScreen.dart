import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:result_nepal/Custom/bottomnavy.dart';
import 'package:result_nepal/Views/Auth/login_screem.dart';
import 'package:result_nepal/Views/Dashboard/detail_screen.dart';
import 'package:result_nepal/Views/Dashboard/profile_screen.dart';
import 'package:result_nepal/utils/colors.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeBody(),
    ProfileScreen(), // No routing now, just show as child
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Obx(() {
          if (selectedIndex.value == 0) {
            // Show login + bell icon only in Home
            return AppBar(
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage:
                              AssetImage("assets/icons/Avatar.png"),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "loginRegister",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Image.asset("assets/icons/bell.png", width: 50, height: 50),
                ],
              ),
            );
          } else {
            // Let ProfileScreen show its own AppBar
            return PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox.shrink(),
            );
          }
        }),
      ),
      body: Obx(() => screens[selectedIndex.value]), // Switch view
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) => selectedIndex.value = index,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> gridItems = [
      {"title": "BLE Result", "image": "assets/common/ble.png"},
      {"title": "SEE Result", "image": "assets/common/ble.png"},
      {"title": "SLC Result", "image": "assets/common/ble.png"},
      {"title": "IPO Result", "image": "assets/common/ipo.png"},
    ];

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.buttonColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.buttonColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.buttonColor, width: 2),
              ),
              suffixIcon:
                  const Icon(Icons.search, color: AppColors.buttonColor),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.buttonColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CarouselSlider(
                items: [
                  Image.asset("assets/common/carousel.jpg",
                      fit: BoxFit.cover, width: double.infinity),
                ],
                options: CarouselOptions(
                  height: 160,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("All Results", style: CustomTextStyles.f18W500())],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
              ),
              itemCount: gridItems.length,
              itemBuilder: (context, index) {
                final item = gridItems[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => DetailScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(item["image"]!),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item["title"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

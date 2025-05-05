import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_nepal/Custom/bottomnavy.dart';
import 'package:result_nepal/Views/Auth/login_screem.dart';
import 'package:result_nepal/Views/Dashboard/profile_screen.dart';
import 'package:result_nepal/utils/custom_text_style.dart';

class HomeScreen extends StatelessWidget {
  final RxInt currentIndex = 0.obs; // Made this observable
  final List<String> itemNames = [
    "courses",
    "softwareDevelopment",
    "digitalMarketing",
    "courier",
    "travelAgency",
    "newsPortal",
    "photoEditor",
    "videoCreation",
    "postBoost",
    "mart",
    "lifeInsurance",
    "intern"
  ];

  HomeScreen({super.key});

  void onItemTapped(int index) {
    currentIndex.value = index; // Update the observable value
    if (index == 1) {
      Get.to(() => HomeScreen());
    } else if (index == 2) {
      Get.to(() => ProfileScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavBar(
            currentIndex: currentIndex.value,
            onTap: onItemTapped,
          )),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
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
                    Image.asset(
                      "assets/icons/Avatar.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "loginRegister",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/bell.png",
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                Image.asset(
                  "assets/icons/mic.png",
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 8),
                Image.asset(
                  "assets/icons/filter.png",
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            const SizedBox(height: 10),
            CarouselSlider(
              items: [
                Image.asset("assets/common/software.jpg", fit: BoxFit.fill),
                Image.asset("assets/common/digital.jpg", fit: BoxFit.fill),
                Image.asset("assets/common/courses.jpg", fit: BoxFit.fill),
                Image.asset("assets/common/video.jpg", fit: BoxFit.fill),
              ],
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("ourServices", style: CustomTextStyles.f18W500())
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                ),
                itemCount: itemNames.length,
                itemBuilder: (context, index) {
                  final List<Widget> screens = [HomeScreen(), ProfileScreen()];

                  final List<String> imagePaths = [
                    "assets/icons/course.png",
                    "assets/icons/software.png",
                    "assets/icons/digital.png",
                    "assets/icons/car.png",
                    "assets/icons/travel.png",
                    "assets/icons/news.png",
                    "assets/icons/photo.png",
                    "assets/icons/video.png",
                    "assets/icons/boost.png",
                    "assets/icons/mart.png",
                    "assets/icons/insurance.png",
                    "assets/icons/intern.png",
                  ];

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => screens[index % screens.length]);
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
                                image: AssetImage(imagePaths[index]),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        itemNames[index],
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final RxInt currentIndex = 0.obs;  // Define the controller inside BottomNavBar
  
  final Function(int) onTap;

  BottomNavBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Only two items now
    final List<String> labels = ['Home', 'Profile'];
    final List<IconData> icons = [
      Icons.home,
      Icons.account_circle,
    ];

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xFF334155) : Color(0xFF1D4ED8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(2, (index) {
          return GestureDetector(
            onTap: () {
              currentIndex.value = index; // Change index on tap
              onTap(index); // Trigger the onTap method passed from parent
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Icon(
                    icons[index],
                    color: Colors.white,
                  ),
                  if (currentIndex.value == index) 
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        labels[index],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

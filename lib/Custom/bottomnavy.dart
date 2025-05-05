import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<String> labels = ['Home', 'Share Files', 'Meeting', 'Profile'];
    final List<IconData> icons = [
      Icons.home,
      Icons.file_copy,
      Icons.people,
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
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6), // Space around the icon and text
                  decoration: BoxDecoration(

                      // Always blue // Background color for both icon and text
                      // Circular background
                      ),
                  child: Row(
                    children: [
                      Icon(
                        icons[index],
                        // Always blue
                      ),
                      if (currentIndex == index)
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8), // Space between icon and label
                          child: Text(
                            labels[index],
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Tabs
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_bag),
                  onPressed: () => onTabSelected(1),
                  color: selectedIndex == 1 ? Colors.orange : Colors.grey,
                ),
                Text(
                  "Products",
                  style: TextStyle(
                    color: selectedIndex == 1 ? Colors.orange : Colors.grey,
                  ),
                ),
              ],
            ),
            // Right Tabs
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () => onTabSelected(2),
                  color: selectedIndex == 2 ? Colors.orange : Colors.grey,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: selectedIndex == 2 ? Colors.orange : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

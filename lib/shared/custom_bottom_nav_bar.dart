import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> ontap;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(30),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: ontap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: currentIndex == 0 ? "•" : "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: currentIndex == 1 ? "•" : "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: currentIndex == 2 ? "•" : "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: currentIndex == 3 ? "•" : "",
          ),
        ],
      ),
    );
  }
}

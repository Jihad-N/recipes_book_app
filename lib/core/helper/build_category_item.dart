 import 'package:flutter/material.dart';

Widget buildCategoryItem(
    String title,
    IconData icon,
    bool isSelected,
    VoidCallback ontap,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: isSelected
                ? const Color(0xFF2B2B2B)
                : Colors.white,
            child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey,
            ).copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
          ),
        ],
      ),
    );
  }
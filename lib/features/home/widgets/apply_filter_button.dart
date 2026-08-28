import 'package:flutter/material.dart';

class ApplyFilterButton extends StatelessWidget {
  const ApplyFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2B2B2B),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () => Navigator.pop(context),
      child: const Text(
        "Apply Filters",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

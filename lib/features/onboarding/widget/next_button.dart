import 'package:flutter/material.dart';
import 'package:recipe_book_app/core/routes/app_routes.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required int currentPage,
    required List<Map<String, dynamic>> onboardingData,
    required PageController pageController,
  }) : _currentPage = currentPage, _onboardingData = onboardingData, _pageController = pageController;

  final int _currentPage;
  final List<Map<String, dynamic>> _onboardingData;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_currentPage < _onboardingData.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        } else {
          // navigate
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.layout,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2B2B2B),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _currentPage == _onboardingData.length - 1
                ? "Get Started"
                : "next",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}

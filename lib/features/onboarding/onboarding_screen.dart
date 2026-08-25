import 'package:flutter/material.dart';
import 'package:recipe_book_app/core/routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // قائمة بيانات الصفحات الثلاثة (يمكنكِ تغيير النصوص والألوان حسب الرغبة)
  final List<Map<String, dynamic>> _onboardingData = [
    {
      "words": ["Cook", "smarter", "not", "harder"],
      "colors": [
        Color(0xFF90CAF9),
        Color(0xFFCE93D8),
        Color(0xFFFFAB91),
        Color(0xFFC5E1A5),
      ],
      "subtitle": "Quick & easy lunch recipes, ready\nin under 30 minutes",
    },
    {
      "words": ["Track", "your", "daily", "calories"],
      "colors": [
        Color(0xFFFFCC80),
        Color(0xFFA5D6A7),
        Color(0xFFB39DDB),
        Color(0xFFEF9A9A),
      ],
      "subtitle": "Eat healthy and keep your body\nin perfect shape easily",
    },
    {
      "words": ["Share", "with", "your", "friends"],
      "colors": [
        Color(0xFF80DEEA),
        Color(0xFFFFF59D),
        Color(0xFFB0BEC5),
        Color(0xFFFFCC80),
      ],
      "subtitle":
          "Publish your secret recipes and\nget feedback from community",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2CC), // الخلفية الفاتحة الموحدة
      body: SafeArea(
        child: Column(
          children: [
            // المساحة العلوية المخصصة للصور أو الرسومات
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    _currentPage == 0
                        ? Icons.restaurant
                        : (_currentPage == 1
                              ? Icons.fitness_center
                              : Icons.people),
                    size: 120,
                    key: ValueKey<int>(_currentPage),
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            // صندوق البيانات السفلي المتجاوب
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final data = _onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // الكلمات الملونة بداخل كبسولات (Badges) مع أنيميشن سلاسة
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 400),
                          opacity: _currentPage == index ? 1.0 : 0.0,
                          child: Wrap(
                            spacing: 6,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: List.generate(data["words"].length, (
                              wIndex,
                            ) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: data["colors"][wIndex],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  data["words"][wIndex],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // النص الفرعي التوضيحي
                        Text(
                          data["subtitle"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // شريط التحكم السفلي (المؤشرات والزر)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // مؤشرات الصفحات النقاط الثلاثة (Page Indicators)
                  Row(
                    children: List.generate(_onboardingData.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 8),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF2B2B2B)
                              : Colors.black26,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),

                  // Next button
                  ElevatedButton(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

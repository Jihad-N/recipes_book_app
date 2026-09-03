import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/core/routes/app_routes.dart';
import 'package:recipe_book_app/features/home/home_layout.dart';
import 'package:recipe_book_app/features/home/home_screen.dart';
import 'package:recipe_book_app/features/onboarding/onboarding_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => RecipeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFE8F5E9),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFf121212),
        cardColor: Color.fromARGB(255, 45, 45, 45),
      ),
      routes: {
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.home: (context) => const Homescreen(),
        AppRoutes.layout: (context) => const HomeLayout(),

        //AppRoutes.details:(context)=> const RecipeDetailsScreen(recipe: ),
      },
      initialRoute: AppRoutes.onboarding,
      themeMode: recipeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

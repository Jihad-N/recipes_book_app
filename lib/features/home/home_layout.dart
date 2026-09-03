import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/features/book/book_screen.dart';
import 'package:recipe_book_app/features/favorite/favorite_screen.dart';
import 'package:recipe_book_app/features/home/home_screen.dart';
import 'package:recipe_book_app/features/profile/profile_screen.dart';
import 'package:recipe_book_app/shared/custom_bottom_nav_bar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    final List<Widget> _screens = [
      const Homescreen(),
      const BookScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _screens[recipeProvider.currentNavIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: recipeProvider.currentNavIndex,
        ontap: (int index) {
          recipeProvider.changeNavIndex(index);
        },
      ),
    );
  }
}

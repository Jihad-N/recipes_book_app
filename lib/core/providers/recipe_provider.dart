import 'package:flutter/foundation.dart';
import 'package:recipe_book_app/core/dummy_data/dummy_recipes.dart';
import 'package:recipe_book_app/core/models/recipe_model.dart';

class RecipeProvider extends ChangeNotifier {
  String _selectedCategory = 'Lunch';
  int _currentNavIndex = 0;
  String _searchQuery = '';
  bool _isDarkMode = false;
  String _selectedAvatar = 'assets/images/watermellon.png';
  final List<String> _avatars = [
    'assets/images/watermellon.png',
    'assets/images/orange.png',
    'assets/images/kiwi.png',
    'assets/images/jewif.png',
    'assets/images/dragon-fruit.png',
  ];

  String get selectedCategory => _selectedCategory;
  int get currentNavIndex => _currentNavIndex;
  String get searchQuery => _searchQuery;
  bool get isDarkMode => _isDarkMode;
  List<String> get avatars => _avatars;
  String get selectedAvatar => _selectedAvatar;

  List<RecipeModel> get filteredRecipes {
    return dummyRecipes.where((recipe) {
      final matchesCategory =
          recipe.category.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesSearch = recipe.title.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );

      return matchesCategory && matchesSearch;
    }).toList();
  }

  void changeCategory(String newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  void changeNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void updateAvatar(String avatarUrl){
    _selectedAvatar = avatarUrl;
    notifyListeners();
  }
  
}

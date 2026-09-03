import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/core/theme/app_colors.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final myCreatedRecipes = recipeProvider.myCustomRecipes;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "My Cookbook",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: myCreatedRecipes.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu_book, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "Your cookbook is empty!",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "Tap '+' to add your own secret recipe.",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: myCreatedRecipes.length,
              itemBuilder: (context, index) {
                final item = myCreatedRecipes[index];
                return Card(
                  color: Theme.of(context).cardColor,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.secondary,
                      child: Icon(Icons.restaurant_menu, color: Colors.white),
                    ),
                    title: Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${item.durationInMinutes} mins • ${item.difficulty}",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),

      // الزر العائم لإضافة وصفة جديدة
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showAddRecipeBottomSheet(context, recipeProvider);
        },
      ),
    );
  }

  // نافذة إدخال بيانات الوصفة الجديدة وربطها الفعلي بالـ Provider
  void _showAddRecipeBottomSheet(
    BuildContext context,
    RecipeProvider provider,
  ) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController durationController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Custom Recipe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Recipe Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Duration (Minutes)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightTextPrimary,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  final String title = titleController.text.trim();
                  final String durationStr = durationController.text.trim();
                  final String category = categoryController.text.trim();

                  if (title.isNotEmpty &&
                      durationStr.isNotEmpty &&
                      category.isNotEmpty) {
                    final int? duration = int.tryParse(durationStr);

                    if (duration != null) {
                      provider.addCustomRecipe(title, duration, category);

                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Recipe saved to your cookbook successfully!",
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  "Save Recipe",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

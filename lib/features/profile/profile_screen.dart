import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/core/theme/app_text_styles.dart';
import 'package:recipe_book_app/features/profile/widgets/avatar_sheet_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppTextStyles.blackfont22Bold.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // 1. قسم الصورة الشخصية والبيانات الأساسية
            AvatarSheetWidget(recipeProvider: recipeProvider),

            const SizedBox(height: 16),
            Text(
              "Sarah Ahmed",
              style: AppTextStyles.blackfont22Bold.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            Text("sarah.developer@email.com", style: AppTextStyles.greyfont15),
            const SizedBox(height: 24),

            // 2. بطاقة الإحصائيات (Stats Card)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem("24", "Favorites"),
                  Container(height: 30, width: 1, color: Colors.grey[300]),
                  _buildStatItem("1,200", "Kcal Today"),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 3. قائمة الإعدادات والخيارات
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.favorite_border),
                    title: const Text("My Favorites"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    secondary: const Icon(Icons.dark_mode_outlined),
                    title: const Text("Dark Mode"),
                    value: recipeProvider.isDarkMode,
                    onChanged: (bool value) {
                      recipeProvider.toggleTheme(value);
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text("Language"),
                    trailing: const Text(
                      "English",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

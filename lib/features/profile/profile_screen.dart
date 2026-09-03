import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/core/theme/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFFFCC80),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
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

// import 'package:flutter/material.dart';
// import 'package:recipe_book_app/core/theme/app_colors.dart';
// import 'package:recipe_book_app/shared/custom_app_bar.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lightSurface,
//       appBar: CustomAppBar(onPressed: () {}, actionsIcon: Icon(null)),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             child: Stack(
//               children: [
//                 CircleAvatar(
//                   radius: 75,
//                   backgroundColor: AppColors.primary,
//                   child: Icon(
//                     Icons.person_rounded,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 5,
//                   left: 5,
//                   child: CircleAvatar(
//                     radius: 15,
//                     backgroundColor: AppColors.darkSurface,
//                     child: Icon(
//                       Icons.photo_camera_outlined,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(24.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [Text('LogOut '), Icon(Icons.logout_rounded)],
//                     ),
//                   ),
//                   TextButton(onPressed: () {}, child: Text('Mode')),
//                   TextButton(onPressed: () {}, child: Text('Invite a friend')),
//                   TextButton(onPressed: () {}, child: Text('Rate Us')),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

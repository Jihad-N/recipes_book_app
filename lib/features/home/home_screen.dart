import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_app/core/helper/build_category_item.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/features/details/recipe_details_screen.dart';
import 'package:recipe_book_app/features/home/widgets/recipe_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //final recipe = dummyRecipes[0];
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final allrecipes = recipeProvider.filteredRecipes;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFE8F5E9),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2B2B2B)),
              child: Text(
                'Chef Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.black),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //(Search Bar)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(12),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                // ربط الكتابة بالـ Provider مباشرة عند كل تغيير
                onChanged: (value) {
                  recipeProvider.updateSearchQuery(value);
                },
                decoration: InputDecoration(
                  hintText: "Search recipes, ingredients...",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  // زر لمسح النص المكتوب (يظهر فقط إذا كان هناك نص)
                  suffixIcon: recipeProvider.searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            recipeProvider.updateSearchQuery('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 1. قسم التصنيفات العلوية
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildCategoryItem(
                  "Breakfast",
                  Icons.egg_outlined,
                  recipeProvider.selectedCategory == "Breakfast",
                  () => recipeProvider.changeCategory("Breakfast"),
                ),
                buildCategoryItem(
                  "Lunch",
                  Icons.lunch_dining,
                  recipeProvider.selectedCategory == "Lunch",
                  () => recipeProvider.changeCategory('Lunch'),
                ),
                buildCategoryItem(
                  "Drinks",
                  Icons.local_drink_outlined,
                  recipeProvider.selectedCategory == "Drinkes",
                  () => recipeProvider.changeCategory('Drinkes'),
                ),
                buildCategoryItem(
                  "Desserts",
                  Icons.cake_outlined,
                  recipeProvider.selectedCategory == "Diserts",
                  () => recipeProvider.changeCategory('Diserts'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 2. عنوان القسم وعدد الوجبات
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${recipeProvider.filteredRecipes.length} ${recipeProvider.selectedCategory.toLowerCase()}s",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.black),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(24),
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Filter Recipes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),

                              //  خيار لفلترة Difficulty
                              const Text(
                                "Difficulty",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Easy"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Medium"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Hard"),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2B2B2B),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Apply Filters",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 3. (Recipe Card)
            allrecipes.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        "No recipes match your search",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // لمنع التعارض مع سكرول الشاشة الأساسية
                    itemCount: allrecipes.length,
                    itemBuilder: (context, index) {
                      final item = allrecipes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetailsScreen(recipe: item),
                            ),
                          );
                        },
                        child: RecipeCard(item: item),
                      );
                    },
                  ),
          ],
        ),
      ),

      //Bottom nav bar
      //bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

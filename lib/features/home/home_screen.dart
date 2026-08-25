import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/features/details/recipe_details_screen.dart';

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
                _buildCategoryItem(
                  "Breakfast",
                  Icons.egg_outlined,
                  recipeProvider.selectedCategory == "Breakfast",
                  () => recipeProvider.changeCategory("Breakfast"),
                ),
                _buildCategoryItem(
                  "Lunch",
                  Icons.lunch_dining,
                  recipeProvider.selectedCategory == "Lunch",
                  () => recipeProvider.changeCategory('Lunch'),
                ),
                _buildCategoryItem(
                  "Drinks",
                  Icons.local_drink_outlined,
                  recipeProvider.selectedCategory == "Drinkes",
                  () => recipeProvider.changeCategory('Drinkes'),
                ),
                _buildCategoryItem(
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
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // card code:
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                ),

                                child: Center(
                                  child: Image.network(
                                    item.imageUrl,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Container(
                                            height: 180,
                                            color: Colors.grey[200],
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 180,
                                        width: double.infinity,

                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(24),
                                          ),
                                          color: Color(0xFFFFCC80),
                                        ),
                                        child: Icon(
                                          Icons.restaurant,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.description,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 12),

                                    // تفاصيل الوجبة (التقييم والوقت والصعوبة)
                                    Row(
                                      children: [
                                        _buildInfoBadge(
                                          icon: Icons.star_rate_rounded,
                                          text: " ${item.rating}",
                                          bgColor: const Color(0xFFFFF9C4),
                                        ),
                                        const SizedBox(width: 8),
                                        _buildInfoBadge(
                                          icon: Icons.timer,
                                          text:
                                              " ${item.durationInMinutes} mins",
                                          bgColor: const Color(0xFFF8BBD0),
                                        ),
                                        const SizedBox(width: 8),
                                        _buildInfoBadge(
                                          icon: Icons.bar_chart_sharp,
                                          text: item.difficulty,
                                          bgColor: Color(0xFFD1C4E9),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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

  // ميثود مساعدة لبناء عنصر التصنيف
  Widget _buildCategoryItem(
    String title,
    IconData icon,
    bool isSelected,
    VoidCallback ontap,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: isSelected
                ? const Color(0xFF2B2B2B)
                : Colors.white,
            child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ميثود مساعدة لبناء شارات المعلومات الصغيرة
  Widget _buildInfoBadge({
    required String text,
    required Color bgColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

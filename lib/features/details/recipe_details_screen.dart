import 'package:flutter/material.dart';
import 'package:recipe_book_app/core/helper/build_Info_badge.dart';
import 'package:recipe_book_app/core/models/recipe_model.dart';
import 'package:recipe_book_app/shared/custom_recipe_image_widget.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 237, 254),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //plate image
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(248, 176, 109, 42),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),

                child: ClipOval(child: CustomImageWidget(item: recipe)),
              ),
            ),

            const SizedBox(height: 32),

            // 2. اسم الوجبة ووصفها
            Text(
              recipe.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              recipe.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),

            // 3. شارات معلومات الوقت والصعوبة
            Row(
              children: [
                buildInfoBadge(
                  text: " ${recipe.durationInMinutes} Mins",
                  bgColor: const Color(0xFFF8BBD0),
                  icon: Icons.star_rate_rounded,
                ),
                const SizedBox(width: 12),
                buildInfoBadge(
                  text: " ${recipe.difficulty}",
                  bgColor: const Color(0xFFD1C4E9),
                  icon: Icons.timer,
                ),
                const SizedBox(width: 12),
                buildInfoBadge(
                  text: " ${recipe.rating}",
                  bgColor: const Color(0xFFFFF9C4),
                  icon: Icons.bar_chart_sharp,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // 4. عنوان المكونات
            const Text(
              "Ingredients",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 5. قائمة المكونات المبنية ديناميكياً من الـ Model
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recipe.ingredients.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 12,
                        backgroundColor: Color(0xFF2B2B2B),
                        child: Text(
                          "$index",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        recipe.ingredients[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),

            //instructions:
            const Text(
              "Instructions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recipe.instructions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        minRadius: 12,
                        backgroundColor: Color(0xFF2B2B2B),
                        child: Text(
                          "$index",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          recipe.instructions[index],
                          style: const TextStyle(fontSize: 16),
                          softWrap: true,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

 }

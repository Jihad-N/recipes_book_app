import 'package:flutter/material.dart';
import 'package:recipe_book_app/core/helper/build_Info_badge.dart';
import 'package:recipe_book_app/core/models/recipe_model.dart';
import 'package:recipe_book_app/shared/custom_recipe_image_widget.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.item});

  final RecipeModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // card code:
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),

            child: Center(child: CustomImageWidget(item: item)),
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
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 12),

                // تفاصيل الوجبة (التقييم والوقت والصعوبة)
                Row(
                  children: [
                    buildInfoBadge(
                      icon: Icons.star_rate_rounded,
                      text: " ${item.rating}",
                      bgColor: const Color(0xFFFFF9C4),
                    ),
                    const SizedBox(width: 8),
                    buildInfoBadge(
                      icon: Icons.timer,
                      text: " ${item.durationInMinutes} mins",
                      bgColor: const Color(0xFFF8BBD0),
                    ),
                    const SizedBox(width: 8),
                    buildInfoBadge(
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
    );
  }
}

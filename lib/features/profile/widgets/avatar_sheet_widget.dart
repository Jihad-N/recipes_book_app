import 'package:flutter/material.dart';
import 'package:recipe_book_app/core/providers/recipe_provider.dart';
import 'package:recipe_book_app/core/theme/app_colors.dart';
import 'package:recipe_book_app/core/theme/app_text_styles.dart';

class AvatarSheetWidget extends StatelessWidget {
  const AvatarSheetWidget({super.key, required this.recipeProvider});

  final RecipeProvider recipeProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(24),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose your Avatar",
                    style: AppTextStyles.blackfont18Bold.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: recipeProvider.avatars.map((avatarUrl) {
                          return GestureDetector(
                            onTap: () {
                              recipeProvider.updateAvatar(avatarUrl);
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 8.0,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    recipeProvider.selectedAvatar == avatarUrl
                                    ? AppColors.secondary
                                    : AppColors.lightTextSecondary,
                                backgroundImage: AssetImage(avatarUrl),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.secondary,
        backgroundImage: AssetImage(recipeProvider.selectedAvatar),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:recipe_book_app/core/models/recipe_model.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.item,
  });

  final RecipeModel item;

  @override
  Widget build(BuildContext context) {
    return Image.network(
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
    );
  }
}

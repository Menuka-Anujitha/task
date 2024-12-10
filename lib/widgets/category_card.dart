import 'package:flutter/material.dart';
import 'package:nba_highlights/models/category_model.dart';
import 'package:nba_highlights/utils/colors.dart';
import 'package:nba_highlights/utils/text_styles.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({Key? key, required this.category, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // add borders
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.lightGreen,
            width: 1,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                category.image,
                fit: BoxFit.cover,
              ),
            ),
            // Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0XFF3ECF8E).withOpacity(0.8),
                  ],
                ),
              ),
            ),
            // Title text
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                category.title,
                style: AppTextStyles.appSubtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nba_highlights/services/categories_service.dart';
import 'package:nba_highlights/models/category_model.dart';
import 'package:nba_highlights/utils/colors.dart';
import 'package:nba_highlights/utils/router.dart';
import 'package:nba_highlights/utils/text_styles.dart';
import 'package:nba_highlights/widgets/button.dart';
import 'package:nba_highlights/widgets/category_card.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesService _categoriesService = CategoriesService();

  // Fetch the categories list as BottomSheet
  void _showCategoriesBottomSheet() async {
    final categories = await _categoriesService.getCategories().first;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: GestureDetector(
                              onTap: () {
                                // Navigate to relevant category details page
                                AppRouter.router.push(
                                  "/singleCategory",
                                  extra: category,
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    category.title,
                                    style: AppTextStyles.appDescription,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.textColor,
                                    size: 20.0,
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Custom app bar
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    child: Image(image: AssetImage("assets/icons/logo.png")),
                  ),
                  SizedBox(width: 5.0),
                  Text("NBA Highlights", style: AppTextStyles.appTitle),
                ],
              ),
              SizedBox(height: 50.0),

              // Shimmer grid view
              StreamBuilder<List<Category>>(
                stream: _categoriesService.getCategories(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 45,
                        childAspectRatio: 1,
                      ),
                      itemCount:
                          snapshot.connectionState == ConnectionState.waiting
                              ? 4 // Display 4 shimmer items when waiting
                              : snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            baseColor: AppColors.lightGreen.withOpacity(0.8),
                            highlightColor:
                                AppColors.lightGreen.withOpacity(0.6),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.lightGreen.withOpacity(0.6),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text(
                            'Error loading categories',
                            style: AppTextStyles.appDescription,
                          ));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                              child: Text(
                            'No categories available',
                            style: AppTextStyles.appDescription,
                          ));
                        } else {
                          final categories = snapshot.data!;
                          final category = categories[index];
                          return CategoryCard(
                            category: category,
                            onTap: () {
                              // Navigate to relevant category details page
                              AppRouter.router.push(
                                "/singleCategory",
                                extra: category,
                              );
                            },
                          );
                        }
                      },
                    ),
                  );
                },
              ),

              // Button to show BottomSheet with category list
              Button(
                onPressed: _showCategoriesBottomSheet,
                buttonText: "Categories",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

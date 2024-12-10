import 'package:flutter/material.dart';
import 'package:nba_highlights/utils/colors.dart';

class AppTextStyles {
  static TextStyle splash = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.kPrimaryColor,
  );
  static TextStyle appTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle appSubtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle appDescription = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle appButton = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
}

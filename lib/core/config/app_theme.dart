import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/text_styles.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary),
  textTheme: TextTheme(
    headlineLarge: AppTextStyles.headline,
    bodyLarge: AppTextStyles.body,
  ),
);

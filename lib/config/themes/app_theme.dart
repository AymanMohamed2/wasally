import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hint,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}

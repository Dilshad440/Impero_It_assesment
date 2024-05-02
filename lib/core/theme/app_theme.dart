import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getAppTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black,
        centerTitle: true,
        elevation: 6,
        titleTextStyle: AppTextStyle.display.medium,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith(
            (states) => AppColors.white,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: AppColors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

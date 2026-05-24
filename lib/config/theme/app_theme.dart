import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  // Dark Theme Configuration
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    // يمكنك إضافة تعديلات الدارك ثيم هنا لاحقاً
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  // Light Theme Configuration
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.light,

    // إعدادات الـ AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),

    // إعدادات الـ Card
    cardTheme: const CardThemeData(
      // تمت إضافة Data هنا
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),

    // إعدادات الـ Input (الحقول والنصوص المدخلة)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide
            .none, // لجعل الحقل يبدو أنيقاً بدون حواف حادة إذا كان ملوناً
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
    ),
  );
}

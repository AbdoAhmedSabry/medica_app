import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 377.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.font22Bold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

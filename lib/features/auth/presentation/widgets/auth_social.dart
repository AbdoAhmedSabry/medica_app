import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "OR",
            style: AppTextStyles.font22BoldAveria.copyWith(
              color: AppColors.textColor2,
            ),
          ),
        ),
        SizedBox(height: 19.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.subtract,
              child: CircleAvatar(
                radius: 19,
                backgroundColor: Colors.white,
                child: Icon(Icons.facebook, color: AppColors.primary),
              ),
            ),
            CircleAvatar(
              radius: 27,
              backgroundColor: AppColors.subtract,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                child: Icon(Icons.facebook, color: AppColors.primary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

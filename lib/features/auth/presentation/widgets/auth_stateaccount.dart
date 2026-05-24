import 'package:flutter/material.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';

class AuthStateAccount extends StatelessWidget {
  const AuthStateAccount({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: AppTextStyles.font16SemiBold.copyWith(
            color: AppColors.subtract,
          ),
        ),
        Text(
          secondText,
          style: AppTextStyles.font16SemiBold.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

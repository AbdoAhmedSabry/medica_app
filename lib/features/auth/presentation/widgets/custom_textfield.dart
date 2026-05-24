import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_text_styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
  });
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(label, style: AppTextStyles.font22SemiBold),
        ),
        SizedBox(height: 16.h),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.font18Regular,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

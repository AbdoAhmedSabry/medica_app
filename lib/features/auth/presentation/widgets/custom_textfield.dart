import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_text_styles.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.onChanged,
    this.validator,
  });
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String)? onChanged;
  String? Function(String?)? validator;
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
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
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

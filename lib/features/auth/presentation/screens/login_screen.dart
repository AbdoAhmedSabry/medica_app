import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';
import 'package:medica/features/auth/presentation/widgets/auth_button.dart';
import 'package:medica/features/auth/presentation/widgets/auth_social.dart';
import 'package:medica/features/auth/presentation/widgets/auth_stateaccount.dart';
import 'package:medica/features/auth/presentation/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Welcome ",
                    style: AppTextStyles.font26Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 42.h),
                Text("Sign In", style: AppTextStyles.font26Bold),
                SizedBox(height: 25.h),
                Text(
                  "Korem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: AppTextStyles.font18Regular,
                ),
                SizedBox(height: 62.h),
                CustomTextfield(label: "Email ", hintText: "Enter your email"),
                SizedBox(height: 24.h),
                CustomTextfield(
                  label: "Password ",
                  hintText: "Enter your password",
                  suffixIcon: Icon(Icons.visibility, color: AppColors.primary),
                ),
                SizedBox(height: 14.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: AppTextStyles.font18SemiBold,
                  ),
                ),
                SizedBox(height: 73.h),
                CustomButton(text: "Sign In"),
                SizedBox(height: 28.h),
                CustomSocialButton(),
                SizedBox(height: 38.h),
                AuthStateAccount(
                  firstText: "Don’t have an account? ",
                  secondText: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

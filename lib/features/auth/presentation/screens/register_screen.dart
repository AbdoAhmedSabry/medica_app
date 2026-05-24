import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';
import 'package:medica/features/auth/presentation/widgets/auth_button.dart';
import 'package:medica/features/auth/presentation/widgets/auth_social.dart';
import 'package:medica/features/auth/presentation/widgets/auth_stateaccount.dart';
import 'package:medica/features/auth/presentation/widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    "Create New Account ",
                    style: AppTextStyles.font26Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 37.h),
                CustomTextfield(label: "Name ", hintText: "Enter your name"),

                SizedBox(height: 20.h),

                CustomTextfield(label: "Email ", hintText: "Enter your email"),
                SizedBox(height: 20.h),
                CustomTextfield(
                  label: "Password ",
                  hintText: "Enter your password",
                  suffixIcon: Icon(Icons.visibility, color: AppColors.primary),
                ),
                SizedBox(height: 20.h),
                CustomTextfield(
                  label: "Mobile Number ",
                  hintText: "05xxxxxxxxx",
                ),

                SizedBox(height: 62.h),
                CustomButton(text: "Sign Up"),
                SizedBox(height: 28.h),
                CustomSocialButton(),
                SizedBox(height: 28.h),
                AuthStateAccount(
                  firstText: "Already have an account? ",
                  secondText: "Sign In",
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

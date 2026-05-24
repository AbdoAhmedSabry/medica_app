import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';
import 'package:medica/features/auth/presentation/widgets/auth_button.dart';
import 'package:medica/features/auth/presentation/widgets/auth_stateaccount.dart';
import 'package:medica/features/auth/presentation/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                SizedBox(height: 20.h),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "Forgot Password",
                    style: AppTextStyles.font26Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text("Reset Password", style: AppTextStyles.font26Bold),
                SizedBox(height: 15.h),
                Text(
                  "Enter your email and we will send you a link to reset your password",
                  style: AppTextStyles.font18Regular,
                ),
                SizedBox(height: 50.h),
                CustomTextfield(label: "Email", hintText: "Enter your email"),
                SizedBox(height: 60.h),
                CustomButton(text: "Continue"),
                SizedBox(height: 30.h),
                AuthStateAccount(
                  firstText: "Remember your password? ",
                  secondText: "Sign In",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medica/config/const/routes.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';
import 'package:medica/features/auth/presentation/widgets/auth_button.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250.h,
                width: double.infinity,
                alignment: Alignment.center,
                child: Lottie.asset('assets/lottie/Open Mail.json'),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),

              SizedBox(height: 40.h),

              Text(
                "Check your email",
                style: AppTextStyles.font26Bold.copyWith(
                  color: AppColors.primary,
                ),
              ),

              SizedBox(height: 16.h),

              Text(
                "We have sent a password recover instructions to your email.",
                textAlign: TextAlign.center,
                style: AppTextStyles.font18Regular,
              ),

              SizedBox(height: 50.h),

              CustomButton(
                text: "Back to Login",
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

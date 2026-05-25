import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/config/const/routes.dart';
import 'package:medica/config/const/validator.dart';
import 'package:medica/config/theme/app_colors.dart';
import 'package:medica/config/theme/app_text_styles.dart';
import 'package:medica/features/auth/presentation/manger/auth_cubit.dart';
import 'package:medica/features/auth/presentation/manger/authstate.dart';
import 'package:medica/features/auth/presentation/widgets/BUTTONSKELTON.DART';
import 'package:medica/features/auth/presentation/widgets/auth_button.dart';
import 'package:medica/features/auth/presentation/widgets/auth_stateaccount.dart';
import 'package:medica/features/auth/presentation/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    _formKey.currentState?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushReplacementNamed(context, Routes.loginScreen);
                  }
                },

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
                    CustomTextfield(
                      controller: emailController,
                      label: "Email",
                      hintText: "Enter your email",
                      validator: AppValidator.validateEmail,
                    ),
                    SizedBox(height: 60.h),
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) {
                        return current is ForgotPasswordLoading ||
                            previous is ForgotPasswordLoading ||
                            current is ForgotPasswordLoading;
                      },
                      builder: (context, state) {
                        if (state is ForgotPasswordLoading) {
                          return const ButtonSkeleton();
                        }

                        return CustomButton(
                          text: "Continue",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().forgotPassword(
                                emailController.text.trim(),
                              );
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(height: 30.h),
                    AuthStateAccount(
                      firstText: "Remember your password? ",
                      secondText: "Sign In",
                      ontap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.loginScreen,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

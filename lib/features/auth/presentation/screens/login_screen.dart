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
import 'package:medica/features/auth/presentation/widgets/auth_social.dart';
import 'package:medica/features/auth/presentation/widgets/auth_stateaccount.dart';
import 'package:medica/features/auth/presentation/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.patientDataScreen,
                    );
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },
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
                    CustomTextfield(
                      controller: emailController,
                      label: "Email ",
                      validator: AppValidator.validateEmail,
                      hintText: "Enter your email",
                    ),
                    SizedBox(height: 24.h),
                    CustomTextfield(
                      controller: passwordController,
                      label: "Password ",
                      validator: AppValidator.validatePassword,
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(Icons.visibility, color: AppColors.primary),
                      ),
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

                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const ButtonSkeleton();
                        }
                        return CustomButton(
                          text: "Login",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<AuthCubit>()
                                  .signInWithEmailAndPassword(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(height: 28.h),
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          current is FacebookLoading ||
                          previous is FacebookLoading ||
                          current is GoogleLoading ||
                          previous is GoogleLoading ||
                          current is AuthInitial,
                      builder: (context, state) {
                        return CustomSocialButton(
                          isFacebookLoading: state is FacebookLoading,
                          isGoogleLoading: state is GoogleLoading,
                          facebooktap: () =>
                              context.read<AuthCubit>().signInWithFacebook(),
                          googletap: () =>
                              context.read<AuthCubit>().signInWithGoogle(),
                        );
                      },
                    ),
                    SizedBox(height: 38.h),
                    AuthStateAccount(
                      firstText: "Don’t have an account? ",
                      secondText: "Sign Up",
                      ontap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signupScreen,
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

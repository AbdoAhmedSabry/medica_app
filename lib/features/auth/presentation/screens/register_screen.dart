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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
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
                        "Create New Account ",
                        style: AppTextStyles.font26Bold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 37.h),
                    CustomTextfield(
                      label: "Name ",
                      hintText: "Enter your name",
                      controller: _nameController,
                    ),

                    SizedBox(height: 20.h),

                    CustomTextfield(
                      label: "Email ",
                      hintText: "Enter your email",
                      controller: _emailController,
                      validator: AppValidator.validateEmail,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextfield(
                      label: "Password ",
                      hintText: "Enter your password",
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: AppColors.primary,
                      ),
                      controller: _passwordController,
                      validator: AppValidator.validatePassword,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextfield(
                      label: "Mobile Number ",
                      hintText: "05xxxxxxxxx",
                      controller: _mobileController,
                      validator: AppValidator.validatePhoneNumber,
                    ),

                    SizedBox(height: 62.h),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return const ButtonSkeleton();
                        }
                        return CustomButton(
                          text: "Sign Up",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<AuthCubit>()
                                  .signUpWithEmailAndPassword(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                    _mobileController.text,
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
                    SizedBox(height: 28.h),
                    AuthStateAccount(
                      firstText: "Already have an account? ",
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
    ;
  }
}

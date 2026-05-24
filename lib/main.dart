import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medica/features/auth/presentation/screens/checkmail.dart';
import 'package:medica/features/auth/presentation/screens/forgotpassword.dart';
import 'package:medica/features/auth/presentation/screens/login_screen.dart';
import 'package:medica/features/auth/presentation/screens/register_screen.dart';
import 'config/theme/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 933),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Flutter App',

          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,

          home: const CheckEmailScreen(),
        );
      },
    );
  }
}

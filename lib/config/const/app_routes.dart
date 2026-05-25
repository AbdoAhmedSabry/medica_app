import 'package:flutter/material.dart';
import 'package:medica/config/const/routes.dart';
import 'package:medica/features/auth/presentation/screens/checkmail.dart';
import 'package:medica/features/auth/presentation/screens/login_screen.dart';
import 'package:medica/features/auth/presentation/screens/register_screen.dart';
import 'package:medica/features/patient_profile/presentation/screen/patientdata.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splachScreen:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const CheckEmailScreen());
      case Routes.patientDataScreen:
        return MaterialPageRoute(builder: (_) => const PatientDataScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

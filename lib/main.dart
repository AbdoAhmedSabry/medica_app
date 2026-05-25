import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medica/config/cachehelper.dart';
import 'package:medica/config/const/app_routes.dart';
import 'package:medica/config/const/routes.dart';
import 'package:medica/config/di/servicelocator.dart';
import 'package:medica/features/auth/presentation/manger/auth_cubit.dart';
import 'package:medica/features/auth/presentation/screens/checkmail.dart';
import 'package:medica/features/auth/presentation/screens/login_screen.dart';
import 'package:medica/features/auth/presentation/screens/register_screen.dart';
import 'package:medica/features/patient_profile/presentation/screen/patientdata.dart';
import 'config/theme/index.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  setupServiceLocator();
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
        return BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Medica App',
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: const [Locale('en'), Locale('ar')],

            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            initialRoute: Routes.loginScreen,
            onGenerateRoute: AppRouter().generateRoute,
          ),
        );
      },
    );
  }
}

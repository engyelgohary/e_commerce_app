import 'package:e_commerce_app/ui/auth/Login/loginScreen.dart';
import 'package:e_commerce_app/ui/auth/Register/registerScreen.dart';
import 'package:e_commerce_app/ui/splash/splashscreen.dart';
import 'package:e_commerce_app/utils/theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Splash.routeName,
          routes:{
           Splash.routeName:(context) =>const Splash(),
            LoginScreen.routeName:(context) =>const LoginScreen(),
            RegisterScreen.routeName:(context) => RegisterScreen(),

          },
          theme: AppTheme.mainTheme,
        );
      }
    );
  }
}


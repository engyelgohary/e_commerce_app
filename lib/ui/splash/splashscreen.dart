import 'dart:async';

import 'package:e_commerce_app/ui/auth/Login/loginScreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static const String routeName = 'SplashScreen';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body:Image.asset('assets/images/Splash Screen.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      ),
    );
  }
}

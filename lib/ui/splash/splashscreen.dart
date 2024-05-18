import 'dart:async';

import 'package:e_commerce_app/ui/auth/Login/loginScreen.dart';
import 'package:e_commerce_app/ui/auth/Register/registerScreen.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class Splash extends StatelessWidget {
  static const String routeName = 'SplashScreen';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
    });
    return Scaffold(
      body:Image.asset(Assets.imagesSplashScreen,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      ),
    );
  }
}

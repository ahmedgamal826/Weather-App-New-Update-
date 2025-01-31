import 'package:flutter/material.dart';

class SplashViewLogic extends ChangeNotifier {
  void navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}

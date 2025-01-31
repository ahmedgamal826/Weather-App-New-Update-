import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/splash%20view/data/splash_view_logic.dart';
import 'package:weather_app/features/splash%20view/presentations/views/widgets/splash_animations.dart';
import 'package:weather_app/features/splash%20view/presentations/views/widgets/splash_center_widget.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Trigger navigation logic when the widget is built
    context.read<SplashViewLogic>().navigateToHome(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(
                      0xFF81D4FA), // Light Blue Accent (Colors.blueAccent[100])
                  Color(0xFF448AFF), // Blue Accent
                ],
              ),
            ),
          ),
          // Moving clouds animation
          const SplashAnimations(),
          // Rotating sun
          const SplashCenterWidget(),
        ],
      ),
    );
  }
}

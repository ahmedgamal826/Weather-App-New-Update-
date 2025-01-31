import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashCenterWidget extends StatelessWidget {
  const SplashCenterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Animate(
            effects: const [
              RotateEffect(
                duration: Duration(seconds: 8),
                curve: Curves.easeInOut,
              ),
            ],
            child: Image.asset(
              'assets/images/6.png',
              width: width * 0.5,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Weather App",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Check Your Weather!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}

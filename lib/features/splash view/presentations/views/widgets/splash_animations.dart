import 'package:flutter/material.dart';
import 'package:weather_app/features/splash%20view/presentations/views/widgets/build_cloud.dart';

class SplashAnimations extends StatefulWidget {
  const SplashAnimations({Key? key}) : super(key: key);

  @override
  State<SplashAnimations> createState() => _SplashAnimationsState();
}

class _SplashAnimationsState extends State<SplashAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            BuildCloud(
              left: 100 - (_controller.value * 300),
              top: 150,
              size: 120,
            ),
            BuildCloud(
              left: -50 + (_controller.value * 300),
              top: 250,
              size: 150,
            ),
            BuildCloud(
              left: 200 - (_controller.value * 300),
              top: 50,
              size: 100,
            ),
          ],
        );
      },
    );
  }
}

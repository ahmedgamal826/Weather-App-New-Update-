import 'package:flutter/material.dart';

class BuildCloud extends StatelessWidget {
  const BuildCloud({
    super.key,
    required this.left,
    required this.top,
    required this.size,
  });

  final double left;
  final double top;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Image.asset(
        'assets/images/cloud.png',
        width: size,
        fit: BoxFit.contain,
      ),
    );
  }
}

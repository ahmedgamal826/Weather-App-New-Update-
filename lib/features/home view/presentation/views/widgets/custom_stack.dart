import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  CustomStack({
    required this.temp,
    required this.desc,
    required this.icon,
    super.key,
  });

  final String temp;
  final String desc;
  final String icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xff2C2C2C) : Colors.blueAccent[100],
            borderRadius: BorderRadius.circular(15),
          ),
          height: height * 0.21,
          width: width,
        ),
        Positioned(
          right: 70,
          top: 25,
          child: Text(
            temp,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 80,
              color: isDark ? Colors.orange[100] : Colors.white,
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          child: Image.asset(
            "${icon}",
            height: height * 0.19,
            width: width * 0.5,
          ),
        ),
        Positioned(
          right: 15,
          top: 19,
          child: Text(
            '\u00B0C',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 54,
              color: isDark ? Colors.orange[100] : Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 30,
          child: Text(
            desc,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: isDark ? Colors.orange[100] : Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

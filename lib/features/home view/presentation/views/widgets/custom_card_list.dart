import 'package:flutter/material.dart';

class CustomCardList extends StatelessWidget {
  final String image;
  final String title;
  final String value;

  CustomCardList(
      {required this.image, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff2C2C2C) : const Color(0xFFe2e7fa),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('${image}'),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "${title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.orange[100] : Colors.black,
              ),
            ),
          ),
          Text(
            "$value",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.orange[100] : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

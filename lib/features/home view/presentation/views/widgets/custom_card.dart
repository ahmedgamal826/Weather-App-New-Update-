import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String image;
  String tittle;
  String value;

  CustomCard({required this.image, required this.tittle, required this.value});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 145,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            tittle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xff2C2C2C) : const Color(0xFFe2e7fa),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              width: 60,
              height: 60,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isDark ? Colors.orange[100] : Colors.blue[400],
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

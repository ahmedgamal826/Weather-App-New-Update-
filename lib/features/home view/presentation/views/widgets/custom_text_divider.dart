import 'package:flutter/material.dart';

class CustomTextDivider extends StatelessWidget {
  const CustomTextDivider({
    required this.header,
    super.key,
  });

  final String header;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
        ),
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

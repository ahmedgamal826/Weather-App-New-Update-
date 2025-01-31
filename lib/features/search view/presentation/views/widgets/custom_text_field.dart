import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.onFieldSubmitted,
    required this.onPressed,
    required this.controller,
    required this.focusNode,
  });

  void Function()? onPressed;
  Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: isDark ? Colors.blueAccent[100] : const Color(0xff2C2C2C),
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Type Your City Name...",
          filled: true,
          fillColor: isDark ? const Color(0xff2C2C2C) : Colors.blueAccent[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.location_pin,
            size: 30,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    // общий стиль для текстовых полей
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: obscureText,
    );
  }
}

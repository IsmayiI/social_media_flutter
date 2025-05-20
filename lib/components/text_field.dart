import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  const AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // общий стиль для текстовых полей
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: theme.colorScheme.primaryContainer,
      ),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: theme.colorScheme.secondary,
        ),
        fillColor: theme.colorScheme.primaryContainer,
        filled: true,
        enabledBorder: border,
        focusedBorder: border,
        counterText: '',
      ),
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: 1,
      maxLength: maxLength,
    );
  }
}

import 'package:flutter/material.dart';

// показать SnackBar с сообщением об ошибке
void showSnackBar(BuildContext context, String? message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message ?? 'An error occurred'),
    ),
  );
}

import 'package:flutter/material.dart';

// показать диалог загрузки
void showProgressIndicator(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

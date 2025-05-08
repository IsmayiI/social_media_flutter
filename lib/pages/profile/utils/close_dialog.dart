import 'package:flutter/material.dart';

// закрытие диалога
void closeDialog(BuildContext context, TextEditingController controller) {
  Navigator.pop(context);
  controller.clear();
}

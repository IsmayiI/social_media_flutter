import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

// закрытие диалога
void closeDialog(BuildContext context, TextEditingController controller) {
  Navigator.pop(context);
  controller.clear();
}

// обновить имя
void updateName(BuildContext context, TextEditingController controller) {
  context.read<UserProvider>().updateName(controller.text.trim());
  closeDialog(context, controller);
}

// обновить био
void updateBio(BuildContext context, TextEditingController controller) {
  context.read<UserProvider>().updateBio(controller.text.trim());
  closeDialog(context, controller);
}

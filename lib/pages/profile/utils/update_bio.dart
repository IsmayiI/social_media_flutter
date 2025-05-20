import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

import 'utils.dart';

// обновить био
void updateBio(BuildContext context, TextEditingController controller) {
  final bio = controller.text.trim();

  // если био пустое, то выходим из функции
  if (bio.isEmpty) return;

  context.read<UserProvider>().updateBio(controller.text.trim());
  closeDialog(context, controller);
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

import 'utils.dart';

// обновить имя
void updateName(BuildContext context, TextEditingController controller) {
  final uid = context.read<UserProvider>().uid;
  final name = controller.text.trim();

  // если uid пустой или имя пустое, то выходим из функции
  if (uid == null || name.isEmpty) return;

  context.read<UserProvider>().updateName(name);
  context.read<PostsProvider>().updateNameToPosts(name, uid);

  // закрываем диалоговое окно
  closeDialog(context, controller);
}

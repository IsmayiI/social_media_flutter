import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

// метод для создания поста
Future<void> addPost(BuildContext context) async {
  final name =
      context.read<UserProvider>().user?['name'] as String? ?? 'Anonymous';
  final uid = context.read<AuthProvider>().user?.uid ?? 'uid not found';
  await context.read<PostsProvider>().addPost(name, uid);

  // убираем клавиатуру
  if (context.mounted) FocusScope.of(context).unfocus();
}

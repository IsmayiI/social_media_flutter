import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

// метод для создания поста
Future<void> addPost(BuildContext context) async {
  final String? name =
      context.read<UserProvider>().user?['name'] ?? 'Anonymous';
  await context.read<PostsProvider>().addPost(name ?? 'Anonymous');

  // убираем клавиатуру
  if (context.mounted) FocusScope.of(context).unfocus();
}

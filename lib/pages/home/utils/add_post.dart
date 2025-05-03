import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

// метод для создания поста
Future<void> addPost(
  BuildContext context,
  String? email,
) async {
  await context.read<PostsProvider>().addPost(email ?? 'Anonymous');

  // убираем клавиатуру
  if (context.mounted) FocusScope.of(context).unfocus();
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

AppBar appBar(BuildContext context) {
  // получаем пользователя
  final user = context.watch<UserProvider>().user;

  final name = user?['name'] ?? 'User';

  final themeProvider = context.watch<ThemeProvider>();

  final icon = themeProvider.isDarkMode
      ? const Icon(Icons.sunny)
      : const Icon(Icons.nightlight_round);

  return AppBar(
    title: Text('$name\'s feed'),
    actions: [
      IconButton(
        icon: icon,
        onPressed: () => themeProvider.toggleTheme(),
      ),
    ],
  );
}

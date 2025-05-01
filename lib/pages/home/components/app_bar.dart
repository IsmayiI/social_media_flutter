import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

AppBar appBar(BuildContext context) {
  // получаем пользователя
  final user = context.watch<AuthProvider>().user;

  // метод для выхода из аккаунта
  final signOut = context.read<AuthProvider>().signOut;

  return AppBar(
    title: Text(user?.email ?? 'User'),
    actions: [
      IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () => signOut(context),
      ),
    ],
  );
}

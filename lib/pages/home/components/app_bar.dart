import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

AppBar appBar(BuildContext context) {
  // получаем пользователя
  final user = context.watch<AuthProvider>().user;

  return AppBar(
    title: Text(user?.email ?? 'User'),
  );
}

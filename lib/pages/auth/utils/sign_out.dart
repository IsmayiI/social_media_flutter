import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/navigation/routes.dart';
import 'package:social_media/provider/provider.dart' as provider;

import 'utils.dart';

// метод для выхода из аккаунта
Future<void> signOut(BuildContext context) async {
  // показываем диалог загрузки
  showProgressIndicator(context);

  try {
    await context.read<provider.AuthProvider>().signOut();

    // закрываем диалог загрузки
    if (context.mounted) Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    if (context.mounted) {
      // закрываем диалог загрузки
      Navigator.pop(context);

      // если произошла ошибка, показываем snackBar с сообщением
      showSnackBar(context, e.message);
    }
    return;
  }

  if (context.mounted) {
    // убираем клавиатуру
    FocusScope.of(context).unfocus();

    // если вход успешен, переходим на страницу авторизации которая перенаправит на главную страницу
    goToAuthPage(context);
  }
}

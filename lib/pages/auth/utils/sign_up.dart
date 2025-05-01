import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/navigation/routes.dart';
import 'package:social_media/provider/provider.dart' as provider;

import 'utils.dart';

// метод для регистрации и входа в аккаунт
Future<void> signUp(
  BuildContext context,
  TextEditingController email,
  TextEditingController password,
  TextEditingController confirmPassword,
) async {
  // сравниваем пароли
  if (password.text.trim() != confirmPassword.text.trim()) {
    // если пароли не совпадают, показываем SnackBar с сообщением
    showSnackBar(context, 'Passwords do not match');
    return;
  }

  // показываем диалог загрузки
  showProgressIndicator(context);

  try {
    await context.read<provider.AuthProvider>().signUp(
          email.text.trim(),
          password.text.trim(),
        );

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

  // если вход успешен, переходим на страницу авторизации которая перенаправит на главную страницу
  if (context.mounted) goToAuthPage(context);
}

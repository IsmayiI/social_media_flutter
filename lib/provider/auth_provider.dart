import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/navigation/route_names.dart';

class AuthProvider extends ChangeNotifier {
  User? user;

  AuthProvider() {
    // обновляем состояние при изменении пользователя
    FirebaseAuth.instance.authStateChanges().listen((newUser) {
      if (newUser == null) return;
      user = newUser;
      notifyListeners();
    });
  }

  // ==================== метод для входа в аккаунт
  Future<void> signIn(BuildContext context, TextEditingController email,
      TextEditingController password) async {
    // показываем диалог загрузки
    showProgressIndicator(context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
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

    // если вход успешен, переходим на главную страницу
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, RouteNames.auth);
    }
  }

  // ==================== метод для регистрации и входа в аккаунт
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
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

    // если вход успешен, переходим на главную страницу
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, RouteNames.auth);
    }
  }

  // ==================== метод для выхода из аккаунта
  Future<void> signOut(BuildContext context) async {
    // показываем диалог загрузки
    showProgressIndicator(context);

    try {
      await FirebaseAuth.instance.signOut();

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

    // если выход успешен, переходим на главную страницу
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, RouteNames.auth);
    }
  }

  // ==================== показать SnackBar с сообщением об ошибке
  void showSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? 'An error occurred'),
      ),
    );
  }

  // ==================== показать диалог загрузки
  void showProgressIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

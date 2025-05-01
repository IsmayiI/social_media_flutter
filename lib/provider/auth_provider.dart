import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? user;
  bool isLoading = true;
  bool get isLoggedIn => user != null;

  AuthProvider() {
    // обновляем состояние при изменении пользователя
    _listenToAuthChanges();
  }

  // метод который слушает изменения состояния аутентификации
  // и обновляет состояние пользователя
  void _listenToAuthChanges() {
    FirebaseAuth.instance.authStateChanges().listen((newUser) {
      user = newUser;
      isLoading = false;
      notifyListeners();
    });
  }

  // метод для входа в аккаунт
  Future<void> signIn(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // метод для регистрации и входа в аккаунт
  Future<void> signUp(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // метод для выхода из аккаунта
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? user;
  bool isLoading = true;
  bool get isLoggedIn => user != null;
  late final StreamSubscription _subscription;

  AuthProvider() {
    // обновляем состояние при изменении пользователя
    _listenToAuthChanges();
  }

  // метод который слушает изменения состояния аутентификации
  // и обновляет состояние пользователя
  void _listenToAuthChanges() {
    _subscription = FirebaseAuth.instance.authStateChanges().listen((newUser) {
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
    // регистрация пользователя в Firebase
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = FirebaseAuth.instance.currentUser!;

    // получаем имя пользователя из email
    final username = user.email?.split('@')[0] ?? 'username';

    // добавление пользователя в Firestore
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'name': username,
      'bio': 'empty bio..',
    });
  }

  // метод для выхода из аккаунта
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    // отписываемся от обновлений аутентификации
    _subscription.cancel();
    super.dispose();
  }
}

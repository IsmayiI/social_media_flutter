import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'provider.dart';

class UserProvider extends ChangeNotifier {
  String? uid;
  Map<String, dynamic>? user;

  // слушаем данные пользователя из Firestore
  void _listenToUserChanges() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((snapshot) {
      user = snapshot.data();
      notifyListeners();
    });
  }

  // вызывается при изменении состояния аутентификации
  void updateWithAuth(AuthProvider authProvider) {
    final currentUser = authProvider.user;
    if (currentUser != null) {
      uid = currentUser.uid;
      notifyListeners();
      _listenToUserChanges();
    }
  }

  // обновление имени пользователя
  void updateName(String name) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'name': name});
  }

  // обновление биографии
  void updateBio(String bio) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'bio': bio});
  }
}

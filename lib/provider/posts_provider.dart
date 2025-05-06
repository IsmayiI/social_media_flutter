import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostsProvider extends ChangeNotifier {
  // контроллер для текстового поля
  final postController = TextEditingController();

  // список постов
  List<QueryDocumentSnapshot<Map<String, dynamic>>> posts = [];
  late final StreamSubscription _subscription;

  PostsProvider() {
    // обновляем состояние при изменении постов
    _listenToPostsChanges();
  }

  // метод для получения постов из Firestore
  void _listenToPostsChanges() {
    _subscription = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      posts = snapshot.docs;
      notifyListeners();
    });
  }

  // метод для обновления количества лайков
  Future<void> updateLikes(
    List<String> likes,
    DocumentReference<Map<String, dynamic>> postRef,
  ) async {
    await postRef.update({
      'likes': likes,
    });
  }

  // метод для создания поста
  Future<void> addPost(String name) async {
    // проверяем, что текстовое поле не пустое
    if (postController.text.isEmpty) return;

    // добавляем пост в Firestore
    await FirebaseFirestore.instance.collection('posts').add({
      'text': postController.text.trim(),
      'createdAt': Timestamp.now(),
      'name': name,
      'likes': [],
    });

    // очищаем текстовое поле
    postController.clear();
  }

  @override
  void dispose() {
    // отписываемся от обновлений Firestore
    _subscription.cancel();
    // очищаем контроллер
    postController.dispose();
    super.dispose();
  }
}

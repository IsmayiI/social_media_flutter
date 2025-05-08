import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostsProvider extends ChangeNotifier {
  // контроллер для текстового поля
  final postController = TextEditingController();

  // список постов
  List<QueryDocumentSnapshot<Map<String, dynamic>>> posts = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> userPosts = [];

  late final StreamSubscription _subscriptionPosts;
  StreamSubscription? _subscriptionUserPosts;

  PostsProvider() {
    // обновляем состояние при изменении постов
    _listenToPostsChanges();
  }

  // метод для получения постов из Firestore
  void _listenToPostsChanges() {
    _subscriptionPosts = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      posts = snapshot.docs;
      notifyListeners();
    });
  }

  // метод для получение постов конкретного пользователя
  void listenToUserPostsChanges(String uid) {
    // отписываемся от предыдущего подписчика, если он существует
    _subscriptionUserPosts?.cancel();

    _subscriptionUserPosts = FirebaseFirestore.instance
        .collection('posts')
        .where('uid', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      userPosts = snapshot.docs;
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
  Future<void> addPost(String name, String uid) async {
    // проверяем, что текстовое поле не пустое
    if (postController.text.isEmpty) return;

    // добавляем пост в Firestore
    await FirebaseFirestore.instance.collection('posts').add({
      'uid': uid,
      'text': postController.text.trim(),
      'createdAt': Timestamp.now(),
      'name': name,
      'likes': [],
    });

    // очищаем текстовое поле
    postController.clear();
  }

  // метод для обновления имени в постах
  Future<void> updateNameToPosts(
    String name,
    String uid,
  ) async {
    final postsSnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('uid', isEqualTo: uid)
        .get();

    for (final doc in postsSnapshot.docs) {
      await doc.reference.update({'name': name});
    }
  }

  @override
  void dispose() {
    // отписываемся от обновлений Firestore
    _subscriptionPosts.cancel();
    _subscriptionUserPosts?.cancel();
    // очищаем контроллер
    postController.dispose();
    super.dispose();
  }
}

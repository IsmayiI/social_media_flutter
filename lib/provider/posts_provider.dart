import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostsProvider extends ChangeNotifier {
  // контроллер для текстового поля
  final postController = TextEditingController();

  // метод для создания поста
  Future<void> addPost(String email) async {
    // проверяем, что текстовое поле не пустое
    if (postController.text.isEmpty) return;

    // добавляем пост в Firestore
    await FirebaseFirestore.instance.collection('posts').add({
      'text': postController.text.trim(),
      'createdAt': Timestamp.now(),
      'email': email,
    });

    // очищаем текстовое поле
    postController.clear();
  }
}

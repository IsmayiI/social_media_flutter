import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostsProvider extends ChangeNotifier {
  final postController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  // метод для создания поста
  Future<void> addPost() async {
    // проверяем, что текстовое поле не пустое
    if (postController.text.trim().isNotEmpty) {
      // добавляем пост в Firestore
      await FirebaseFirestore.instance.collection('posts').add({
        'text': postController.text.trim(),
        'createdAt': Timestamp.now(),
        'email': user.email,
      });

      // очищаем текстовое поле
      postController.clear();
    }
  }
}

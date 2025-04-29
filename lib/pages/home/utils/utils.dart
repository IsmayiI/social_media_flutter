import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> addPost(TextEditingController controller, User user) async {
  // проверяем, что текстовое поле не пустое
  if (controller.text.trim().isNotEmpty) {
    await FirebaseFirestore.instance.collection('posts').add({
      'text': controller.text.trim(),
      'createdAt': Timestamp.now(),
      'email': user.email,
    });

    // очищаем текстовое поле
    controller.clear();
  }
}

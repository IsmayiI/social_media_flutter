import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/theme/colors.dart';

class Post extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> post;
  const Post(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.white,

      // аватарка пользователя
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        child: const Icon(Icons.person),
      ),

      // текст поста
      title: Text(
        post['text'],
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.grey900,
        ),
      ),

      // имейл пользователя
      subtitle: Text(
        post['email'],
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.grey500,
        ),
      ),
    );
  }
}

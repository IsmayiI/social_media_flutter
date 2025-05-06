import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/theme/colors.dart';

import 'components.dart';

class Post extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> post;
  const Post(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      // контент поста
      child: Row(
        children: [
          // кнопка "лайк" и количество лайков
          LikeButton(post),

          const SizedBox(width: 10),

          // текст поста и имейл пользователя
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // текст поста
                Text(
                  post['text'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey900,
                  ),
                ),

                // имейл пользователя
                Text(
                  post['name'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

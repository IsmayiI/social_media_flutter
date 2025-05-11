import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/theme/colors.dart';

import 'components.dart';

class Post extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> post;
  const Post(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    final name = post['name'] as String;
    final text = post['text'] as String;
    final date = post['createdAt'].toDate().toString().substring(0, 10);

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

          // текст поста и имя пользователя, дата поста
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // текст поста
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey900,
                  ),
                ),

                const SizedBox(height: 5),

                // имя пользователя, дата поста
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // имя пользователя
                    _SubText(name),

                    // дата поста
                    _SubText(date),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SubText extends StatelessWidget {
  final String text;
  const _SubText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.grey500,
      ),
    );
  }
}

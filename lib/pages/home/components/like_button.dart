import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/home/utils/utils.dart';
import 'package:social_media/provider/provider.dart';
import 'package:social_media/theme/colors.dart';

class LikeButton extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> post;
  const LikeButton(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    // получаем email пользователя
    final email = context.read<AuthProvider>().user?.email;

    final likes = post['likes'];

    // проверяем, есть ли лайк от текущего пользователя
    final isLiked = likes.contains(email);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // кнопка "лайк"
        IconButton(
          onPressed: () => toggleLike(context, post.id, email),
          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
          color: isLiked ? Colors.red : AppColors.grey500,
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(30, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),

        // количество лайков
        Text(
          likes.length.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey900,
          ),
        ),
      ],
    );
  }
}

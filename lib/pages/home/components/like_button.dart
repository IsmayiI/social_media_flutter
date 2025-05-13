import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/home/utils/utils.dart';
import 'package:social_media/provider/provider.dart';

class LikeButton extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> post;
  const LikeButton(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    // получаем uid пользователя
    final uid = context.read<UserProvider>().uid;

    final likes = List<String>.from(post['likes']);

    // проверяем, есть ли лайк от текущего пользователя
    final isLiked = likes.contains(uid);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // кнопка "лайк"
        IconButton(
          onPressed: () => toggleLike(context, post.id, uid),
          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
          color: isLiked ? Colors.red : Theme.of(context).colorScheme.secondary,
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(30, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),

        // количество лайков
        Text(
          likes.length.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

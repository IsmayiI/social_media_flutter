import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/home/utils/utils.dart';
import 'package:social_media/provider/provider.dart';
import 'package:social_media/theme/colors.dart';

class LikeButton extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> post;
  const LikeButton(this.post, {super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiking = false;
  late bool isLiked;
  late final String? uid;
  late final List<String> likes;

  @override
  void initState() {
    super.initState();

    // получаем uid пользователя
    uid = context.read<UserProvider>().uid;

    likes = List<String>.from(widget.post['likes']);

    // проверяем, есть ли лайк от текущего пользователя
    isLiked = likes.contains(uid);
  }

  // метод переключения лайка
  void onPressed() async {
    if (isLiking) return;
    isLiking = true;

    setState(() {
      isLiked = !isLiked;
    });
    await toggleLike(context, widget.post.id, uid);

    isLiking = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // кнопка "лайк"
        IconButton(
          onPressed: onPressed,
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
          isLiked ? '1' : '0',
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

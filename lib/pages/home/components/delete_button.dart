import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

class DeleteButton extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> post;
  const DeleteButton(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    final deletePost = context.read<PostsProvider>().deletePost;

    // получаем uid текущего пользователя
    final currentUserId = context.read<UserProvider>().uid;

    // проверяем, является ли текущий пользователь владельцем поста
    // если нет, то не отображаем кнопку удаления
    if (currentUserId != post['uid']) return const SizedBox.shrink();

    return IconButton(
      onPressed: () => deletePost(post.id),
      icon: const Icon(Icons.highlight_remove),
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

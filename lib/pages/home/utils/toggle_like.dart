import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

// функция для переключения лайка
Future<void> toggleLike(
  BuildContext context,
  String postId,
  String? uid,
) async {
  // получаем ссылку на пост
  final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);

  // получаем текущие данные поста
  final post = await postRef.get();

  // проверяем, существует ли пост и есть ли uid пользователя
  if (!post.exists) return;
  if (uid == null) return;

  // получаем список лайков
  final likes = List<String>.from(post['likes']);

  // проверяем, есть ли уже лайк от текущего пользователя
  // если лайк уже есть, удаляем его, иначе добавляем
  likes.contains(uid) ? likes.remove(uid) : likes.add(uid);

  // обновляем количество лайков
  if (context.mounted) {
    context.read<PostsProvider>().updateLikes(likes, postRef);
  }
}

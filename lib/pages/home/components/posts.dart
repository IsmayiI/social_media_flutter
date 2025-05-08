import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media/utils/unfocus_textfield.dart';

import 'components.dart';

class Posts extends StatelessWidget {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> posts;
  const Posts(this.posts, {super.key});

  @override
  Widget build(BuildContext context) {
    // если список постов пустой, показываем индикатор загрузки
    if (posts.isEmpty) {
      return const Center(child: Text('Posts are empty'));
    }

    return NotificationListener(
      // убираем клавиатуру при прокрутке списка
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          unfocusTextField(context);
        }
        return true;
      },
      child: ListView.separated(
        itemCount: posts.length,

        // список постов
        itemBuilder: (context, index) {
          final post = posts[index];
          return Post(post);
        },

        // отступ между постами
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}

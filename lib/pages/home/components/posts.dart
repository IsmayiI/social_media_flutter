import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

import 'components.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    // получаем список постов из провайдера
    final posts = context.watch<PostsProvider>().posts;

    // если список постов пустой, показываем индикатор загрузки
    if (posts.isEmpty) {
      return const Center(child: Text('Posts are empty'));
    }

    return ListView.separated(
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
    );
  }
}

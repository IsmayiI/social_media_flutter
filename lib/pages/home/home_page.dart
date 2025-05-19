import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/components/drawer.dart';
import 'package:social_media/provider/provider.dart';
import 'package:social_media/utils/unfocus_textfield.dart';

import 'components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // получаем список постов из провайдера
    final posts = context.watch<PostsProvider>().posts;

    return GestureDetector(
      onTap: () {
        // убираем клавиатуру при нажатии на экран
        unfocusTextField(context);
      },
      child: Scaffold(
        appBar: appBar(context),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // посты
              Expanded(child: Posts(posts)),

              const SizedBox(height: 20),

              // текстовое поле для создания поста
              const NewPostWrapper(),
            ],
          ),
        ),
      ),
    );
  }
}

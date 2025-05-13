import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/components/components.dart';
import 'package:social_media/provider/provider.dart';

import 'components.dart';

class NewPostWrapper extends StatelessWidget {
  const NewPostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // контроллер для текстового поля
    final postController = context.read<PostsProvider>().postController;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // текстовое поле для ввода текста
          Expanded(
            child: AppTextField(
              hintText: 'Write something...',
              controller: postController,
              textInputAction: TextInputAction.newline,
              maxLines: null,
            ),
          ),

          // кнопка создания поста
          const AddPostButton(),
        ],
      ),
    );
  }
}

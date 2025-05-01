import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/components/components.dart';
import 'package:social_media/pages/home/components/add_post_button.dart';
import 'package:social_media/provider/provider.dart';
import 'package:social_media/theme/colors.dart';

class NewPostWrapper extends StatelessWidget {
  const NewPostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = context.read<PostsProvider>().postController;
    final user = context.watch<AuthProvider>().user!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // текстовое поле для ввода текста
          Expanded(
            child: AppTextField(
              hintText: 'Write something ${user.email}',
              controller: postController,
              obscureText: false,
            ),
          ),

          // кнопка создания поста
          const AddPostButton(),
        ],
      ),
    );
  }
}

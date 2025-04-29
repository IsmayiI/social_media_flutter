import 'package:flutter/material.dart';
import 'package:social_media/components/components.dart';
import 'package:social_media/pages/home/components/button.dart';
import 'package:social_media/theme/colors.dart';

class NewPostWrapper extends StatelessWidget {
  final TextEditingController controller;
  const NewPostWrapper(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
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
              hintText: 'Write something',
              controller: controller,
              obscureText: false,
            ),
          ),

          // кнопка создания поста
          CreatePostButton(() {}),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social_media/pages/home/utils/utils.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => addPost(context),
      icon: const Icon(Icons.send),
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(56, 56),
      ),
    );
  }
}

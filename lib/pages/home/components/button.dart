import 'package:flutter/material.dart';

class CreatePostButton extends StatelessWidget {
  final VoidCallback createPost;
  const CreatePostButton(this.createPost, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: createPost,
      icon: const Icon(Icons.send),
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(56, 56),
      ),
    );
  }
}

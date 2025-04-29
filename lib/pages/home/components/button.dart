import 'package:flutter/material.dart';

class CreatePostButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CreatePostButton(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.send),
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(56, 56),
      ),
    );
  }
}

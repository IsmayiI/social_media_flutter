import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
    final addPost = context.read<PostsProvider>().addPost;

    return IconButton(
      onPressed: () => addPost(user),
      icon: const Icon(Icons.send),
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(56, 56),
      ),
    );
  }
}

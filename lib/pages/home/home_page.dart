import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/auth/utils/utils.dart';

import 'components/components.dart';
import 'utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // контроллер для текстового поля
  final controller = TextEditingController();
  // текущий пользователь
  final user = FirebaseAuth.instance.currentUser!;

  // метод для выхода из аккаунта
  void logout() async {
    await signOut(context);
  }

  // метод для создания поста
  void createPost() async {
    await addPost(controller, user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(user, logout),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // посты
            const Expanded(
              child: Posts(),
            ),

            // текстовое поле для создания поста
            NewPostWrapper(
              controller: controller,
              createPost: createPost,
            ),
          ],
        ),
      ),
    );
  }
}

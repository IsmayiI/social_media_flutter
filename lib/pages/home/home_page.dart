import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/auth/utils/utils.dart';

import 'components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // текущий пользователь
  final user = FirebaseAuth.instance.currentUser!;

  // метод для выхода из аккаунта
  void logout() async {
    await signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(user, logout),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            // посты
            Expanded(child: Posts()),

            SizedBox(height: 20),

            // текстовое поле для создания поста
            NewPostWrapper(),
          ],
        ),
      ),
    );
  }
}

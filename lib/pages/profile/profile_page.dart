import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/home/components/components.dart';
import 'package:social_media/provider/provider.dart';

import 'components/components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // получаем email пользователя
    final email =
        context.watch<AuthProvider>().user?.email ?? 'email not found';

    final userPosts = context.watch<PostsProvider>().userPosts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // аватарка
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Icon(Icons.person, size: 100),
              ),

              // имейл
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  email,
                  style: const TextStyle(fontSize: 18),
                ),
              ),

              // детали
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 10),

              // имя
              const DetailCard('name'),

              const SizedBox(height: 20),

              // био
              const DetailCard('bio'),

              const SizedBox(height: 20),

              // посты
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Posts',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 10),

              Expanded(child: Posts(userPosts)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/provider/provider.dart';

import 'components/components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    final userDetail = context.watch<UserProvider>().user;

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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Icon(Icons.person, size: 100),
              ),

              // имейл
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  user?.email ?? 'email not found',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              // детали
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Details',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 10),

              // имя
              DetailCard(
                title: 'username',
                value: userDetail?['name'] ?? 'empty..',
              ),

              const SizedBox(height: 20),

              // bio
              DetailCard(
                title: 'bio',
                value: userDetail?['bio'] ?? 'empty..',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

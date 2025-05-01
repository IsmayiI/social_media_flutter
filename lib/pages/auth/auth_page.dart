import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/pages/pages.dart';
import 'package:social_media/provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (authProvider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return authProvider.isLoggedIn ? const HomePage() : const LoginPage();
  }
}

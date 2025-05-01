import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/navigation/route_names.dart';
import 'package:social_media/provider/provider.dart';

import 'components/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // контроллеры для текстовых полей
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // метод для перехода на страницу регистрации
  void goToRegisterPage() {
    Navigator.pushReplacementNamed(context, RouteNames.register);
  }

  // метод для входа в аккаунт
  void signIn() async {
    await context.read<AuthProvider>().signIn(
          context,
          emailController,
          passwordController,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // иконка
            const AuthIcon(),

            const SizedBox(height: 50),

            // текст приветсвия
            const WelcomeText('Welcome back, you\'ve been missed!'),

            const SizedBox(height: 25),

            // текстовые поля
            AppTextField(
              hintText: 'Email',
              controller: emailController,
              obscureText: false,
            ),

            const SizedBox(height: 10),

            AppTextField(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // кнопка входа
            AuthButton(
              text: 'Sign In',
              onPressed: signIn,
            ),

            const SizedBox(height: 25),

            // переход на страницу регистрации
            AuthRichText(
              questionText: 'Don\'t have an account?',
              text: 'Register now',
              onTap: goToRegisterPage,
            ),
          ],
        ),
      ),
    );
  }
}

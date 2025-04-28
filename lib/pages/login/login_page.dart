import 'package:flutter/material.dart';
import 'package:social_media/components/components.dart';
import 'package:social_media/pages/login/components/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // контроллеры для текстовых полей
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // иконка
            const LoginIcon(),

            const SizedBox(height: 50),

            // текст приветсвия
            const WelcomeText(),

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
            AppButton(
              text: 'Sign In',
              onPressed: () {},
            ),

            const SizedBox(height: 25),

            // переход на регистрацию
            AppRichText(
              questionText: 'Don\'t have an account?',
              text: ' Sign Up',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/components.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // контроллеры для текстовых полей
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // метод для перехода на страницу входа
  void goToLoginPage() {
    Navigator.pushReplacementNamed(context, '/login');
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
            const WelcomeText('Let\'s create an account for you'),

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

            const SizedBox(height: 10),

            AppTextField(
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // кнопка входа
            AuthButton(
              text: 'Sign Up',
              onPressed: () {},
            ),

            const SizedBox(height: 25),

            // переход на регистрацию
            AuthRichText(
              questionText: 'Already have an account?',
              text: 'Login now',
              onTap: goToLoginPage,
            ),
          ],
        ),
      ),
    );
  }
}

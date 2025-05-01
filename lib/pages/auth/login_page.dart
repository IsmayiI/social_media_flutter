import 'package:flutter/material.dart';
import 'package:social_media/navigation/routes.dart';

import 'components/components.dart';
import 'utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // контроллеры для текстовых полей
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
              onPressed: () => signIn(
                context,
                emailController,
                passwordController,
              ),
            ),

            const SizedBox(height: 25),

            // переход на страницу регистрации
            AuthRichText(
              questionText: 'Don\'t have an account?',
              text: 'Register now',
              onTap: () => goToRegisterPage(context),
            ),
          ],
        ),
      ),
    );
  }
}

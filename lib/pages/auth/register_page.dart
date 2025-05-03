import 'package:flutter/material.dart';
import 'package:social_media/navigation/routes.dart';

import 'components/components.dart';
import 'utils/utils.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // контроллеры для текстовых полей
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

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
              keyboardType: TextInputType.emailAddress,
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

            // кнопка регистрации
            AuthButton(
              text: 'Sign Up',
              onPressed: () => signUp(
                context,
                emailController,
                passwordController,
                confirmPasswordController,
              ),
            ),

            const SizedBox(height: 25),

            // переход на страницу входа
            AuthRichText(
              questionText: 'Already have an account?',
              text: 'Login now',
              onTap: () => goToLoginPage(context),
            ),
          ],
        ),
      ),
    );
  }
}

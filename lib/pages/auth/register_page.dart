import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/navigation/route_names.dart';
import 'package:social_media/provider/provider.dart';

import 'components/components.dart';
import 'utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // контроллеры для текстовых полей
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // метод для перехода на страницу входа
  void goToLoginPage() {
    Navigator.pushReplacementNamed(context, RouteNames.login);
  }

  // метод для регистрации и входа в аккаунт
  void signUp(BuildContext context) async {
    await context.read<AuthProvider>().signUp(
          context,
          emailController,
          passwordController,
          confirmPasswordController,
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

            // кнопка регистрации
            AuthButton(
              text: 'Sign Up',
              onPressed: signUp,
            ),

            const SizedBox(height: 25),

            // переход на страницу входа
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

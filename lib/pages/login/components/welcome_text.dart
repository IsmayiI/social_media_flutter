import 'package:flutter/material.dart';
import 'package:social_media/theme/colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome back, you\'ve been missed!',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.grey600,
      ),
    );
  }
}

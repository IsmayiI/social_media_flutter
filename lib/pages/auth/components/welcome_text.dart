import 'package:flutter/material.dart';
import 'package:social_media/theme/colors.dart';

class WelcomeText extends StatelessWidget {
  final String text;
  const WelcomeText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.grey600,
      ),
    );
  }
}

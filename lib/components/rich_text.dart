import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_media/theme/colors.dart';

class AppRichText extends StatelessWidget {
  final void Function() onTap;
  final String questionText;
  final String text;
  const AppRichText({
    super.key,
    required this.onTap,
    required this.questionText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: questionText,
        style: const TextStyle(
          color: AppColors.grey600,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: ' $text',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRichText extends StatelessWidget {
  final void Function() onTap;
  final String questionText;
  final String text;
  const AuthRichText({
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
        style: TextStyle(
          color: Theme.of(context).colorScheme.surface,
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

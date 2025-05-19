import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String text;
  const WelcomeText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

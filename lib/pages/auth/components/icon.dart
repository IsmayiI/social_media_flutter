import 'package:flutter/material.dart';

class AuthIcon extends StatelessWidget {
  const AuthIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.lock,
      size: 150,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

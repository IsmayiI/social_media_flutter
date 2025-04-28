import 'package:flutter/material.dart';
import 'package:social_media/theme/colors.dart';

class AuthIcon extends StatelessWidget {
  const AuthIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.lock,
      size: 150,
      color: AppColors.grey900,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social_media/components/components.dart';
import 'package:social_media/theme/colors.dart';

class SettingsDialog extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const SettingsDialog({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.grey300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        'Edit $title',
        style: TextStyle(
          color: AppColors.grey600,
          fontSize: 16,
        ),
      ),
      content: AppTextField(
        hintText: 'enter new $title',
        controller: controller,
      ),
      actions: [
        // кнопка отмены
        TextButton(
          style: TextButton.styleFrom(
            overlayColor: AppColors.grey900,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.grey600),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            overlayColor: AppColors.grey900,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Save',
            style: TextStyle(color: AppColors.grey600),
          ),
        ),
      ],
    );
  }
}

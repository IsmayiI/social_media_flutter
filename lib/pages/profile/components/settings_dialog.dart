import 'package:flutter/material.dart';
import 'package:social_media/components/components.dart';
import 'package:social_media/pages/profile/utils/utils.dart';

class SettingsDialog extends StatelessWidget {
  final String title;
  const SettingsDialog(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    final theme = Theme.of(context).colorScheme;

    return AlertDialog(
      // стиль
      backgroundColor: theme.outline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      // заголовок
      title: Text(
        'Edit $title',
        style: TextStyle(
          color: theme.surface,
          fontSize: 16,
        ),
      ),

      // текстовое поле
      content: AppTextField(
        hintText: 'enter new $title',
        controller: controller,
      ),

      // кнопки
      actions: [
        // кнопка отмены
        _TextButton(
          'Cancel',
          () => closeDialog(context, controller),
        ),

        // кнопка сохранения
        _TextButton(
          'Save',
          title == 'name'
              // если title - имя, то обновляем имя
              ? () => updateName(context, controller)
              // иначе обновляем био
              : () => updateBio(context, controller),
        )
      ],
    );
  }
}

class _TextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _TextButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: theme.primary,
      ),
      child: Text(
        text,
        style: TextStyle(color: theme.surface),
      ),
    );
  }
}

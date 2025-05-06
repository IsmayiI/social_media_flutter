import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/components/components.dart';
import 'package:social_media/provider/provider.dart';
import 'package:social_media/theme/colors.dart';

import 'components.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String value;
  const DetailCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<UserProvider>().controller;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      // контент
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // левая часть
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // заголовок
              Text(
                title,
                style: TextStyle(
                  color: AppColors.grey500,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 5),

              // значение
              Text(value),
            ],
          ),

          // кнопка редактирования
          IconButton(
            icon: const Icon(Icons.settings),
            color: AppColors.grey500,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) =>
                    SettingsDialog(title: title, controller: controller),
              );
            },
          ),
        ],
      ),
    );
  }
}

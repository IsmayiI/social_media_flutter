import 'package:flutter/material.dart';
import 'package:social_media/components/drawer.dart';

import 'components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            // посты
            Expanded(child: Posts()),

            SizedBox(height: 20),

            // текстовое поле для создания поста
            NewPostWrapper(),
          ],
        ),
      ),
    );
  }
}

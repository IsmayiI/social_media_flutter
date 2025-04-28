import 'package:flutter/material.dart';

import 'navigation/navigation.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: Navigation.routes,
      initialRoute: Navigation.initialRoute,
    );
  }
}

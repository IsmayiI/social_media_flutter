import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:social_media/firebase_options.dart';

import 'navigation/navigation.dart';
import 'provider/provider.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => PostsProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
        create: (_) => UserProvider(),
        update: (_, authProvider, userProvider) =>
            userProvider!..updateWithAuth(authProvider),
      ),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // получаем тему
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    final themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routes: Navigation.routes,
      initialRoute: Navigation.initialRoute,
    );
  }
}

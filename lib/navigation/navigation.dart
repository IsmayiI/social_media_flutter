import 'package:flutter/material.dart';
import 'package:social_media/pages/pages.dart';

import 'route_names.dart';

abstract class Navigation {
  // начальный маршрут
  static const String initialRoute = RouteNames.auth;

  // маршруты
  static final routes = <String, Widget Function(BuildContext)>{
    // авторизация
    RouteNames.auth: (_) => const AuthPage(),

    // вход
    RouteNames.login: (_) => const LoginPage(),

    // регистрация
    RouteNames.register: (_) => const RegisterPage(),

    // профиль
    RouteNames.profile: (_) => const ProfilePage(),
  };
}

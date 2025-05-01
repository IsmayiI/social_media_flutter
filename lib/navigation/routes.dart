import 'package:flutter/material.dart';

import 'route_names.dart';

// метод для перехода на страницу входа
void goToLoginPage(BuildContext context) {
  Navigator.pushReplacementNamed(context, RouteNames.login);
}

// метод для перехода на страницу регистрации
void goToRegisterPage(BuildContext context) {
  Navigator.pushReplacementNamed(context, RouteNames.register);
}

// метод для перехода на страницу авторизации
void goToAuthPage(BuildContext context) {
  Navigator.pushReplacementNamed(context, RouteNames.auth);
}

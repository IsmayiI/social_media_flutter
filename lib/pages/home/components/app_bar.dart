import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

AppBar appBar(
  User user,
  VoidCallback logout,
) {
  return AppBar(
    title: Text(user.email ?? 'User'),
    actions: [
      IconButton(
        icon: const Icon(Icons.logout),
        onPressed: logout,
      ),
    ],
  );
}

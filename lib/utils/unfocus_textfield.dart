import 'package:flutter/material.dart';

// убираем клавиатуру
void unfocusTextField(BuildContext context) {
  final FocusScopeNode currentScope = FocusScope.of(context);
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

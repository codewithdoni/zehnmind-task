import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
  MediaQueryData get media => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  void showSnack(String message, {Color? background}) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: background,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}

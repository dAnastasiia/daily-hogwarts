import 'package:flutter/material.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier(super.value);

  void switchTheme(ThemeMode themeMode) {
    debugPrint("$themeMode");
    value = themeMode;
  }
}

class ThemeInheritedWidget extends InheritedWidget {
  final themeNotifier = ThemeNotifier(ThemeMode.dark);

  ThemeInheritedWidget({
    super.key,
    required super.child,
  });

  static ThemeInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeInheritedWidget oldWidget) => true;
}

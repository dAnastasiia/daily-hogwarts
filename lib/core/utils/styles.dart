import 'package:flutter/material.dart';

WidgetStateProperty<TextStyle?> navLabelTextStyle =
    WidgetStateTextStyle.resolveWith((states) {
  return const TextStyle(
    fontSize: 14,
  );
});

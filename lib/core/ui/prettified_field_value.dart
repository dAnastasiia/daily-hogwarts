import 'package:daily_hogwarts/core/model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrettifiedFieldValue extends StatelessWidget {
  final String title;
  final String? value;

  const PrettifiedFieldValue({
    super.key,
    required this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;

    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
        ),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

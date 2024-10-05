import 'package:daily_hogwarts/core/model/settings_view_model.dart';
import 'package:daily_hogwarts/core/utils/methods/get_prettified_widgets_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextList extends StatelessWidget {
  final String title;
  final List<Widget> entries;

  const CustomTextList({
    super.key,
    required this.title,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = context.watch<SettingsViewModel>().themeMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        ...getPrettifiedWidgetsList(entries: entries, spacing: 4.0),
      ],
    );
  }
}

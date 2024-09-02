import 'package:daily_hogwarts/core/utils/methods/get_prettified_widgets_list.dart';
import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...getPrettifiedWidgetsList(entries: entries, spacing: 4.0),
      ],
    );
  }
}

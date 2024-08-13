import 'package:flutter/material.dart';

class CustomTextList extends StatelessWidget {
  const CustomTextList({
    super.key,
    required this.title,
    required this.entries,
  });

  final String title;
  final List<Widget> entries;

  List<Widget> getPrettifiedWidgets(List<Widget> widgets) {
    if (widgets.isEmpty) return [];

    final List<Widget> spacedWidgets = [];
    for (int i = 0; i < widgets.length; i++) {
      spacedWidgets.add(widgets[i]);
      if (i < widgets.length - 1) {
        spacedWidgets.add(const SizedBox(height: 4));
      }
    }
    return spacedWidgets;
  }

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
        ...getPrettifiedWidgets(entries),
      ],
    );
  }
}

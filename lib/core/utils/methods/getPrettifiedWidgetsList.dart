import 'package:flutter/material.dart';

List<Widget> getPrettifiedWidgetsList({
  required List<Widget> entries,
  required double spacing,
}) {
  if (entries.isEmpty) return [];

  final List<Widget> spacedWidgets = [];

  for (int i = 0; i < entries.length; i++) {
    spacedWidgets.add(entries[i]);
    if (i < entries.length - 1) {
      spacedWidgets.add(SizedBox(height: spacing));
    }
  }

  return spacedWidgets;
}

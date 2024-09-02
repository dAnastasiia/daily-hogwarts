import 'package:daily_hogwarts/core/utils/methods/get_prettified_widgets_list.dart';
import 'package:daily_hogwarts/features/settings/ui/account.dart';
import 'package:daily_hogwarts/features/settings/ui/customization.dart';
import 'package:daily_hogwarts/features/settings/ui/main_info.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> entries = [
      MainInfo(),
      Customization(),
      Account(),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getPrettifiedWidgetsList(
            entries: entries,
            spacing: 16.0,
          ),
        ),
      ),
    );
  }
}

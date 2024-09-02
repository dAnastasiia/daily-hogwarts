import 'package:daily_hogwarts/core/model/theme_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_card.dart';
import 'package:daily_hogwarts/core/ui/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Customization extends StatelessWidget {
  const Customization({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeViewModel themeViewMode = context.watch<ThemeViewModel>();

    return CustomCard(
      title: 'Customization',
      children: [
        ListTile(
          title: const Text('Theme'),
          trailing: CustomDropdown(
            value:
                themeViewMode.themeMode == ThemeMode.light ? "Light" : "Dark",
            items: const ['Light', 'Dark'],
            onChanged: (newValue) {
              final newTheme =
                  newValue == "Light" ? ThemeMode.light : ThemeMode.dark;
              themeViewMode.setThemeMode(newTheme);
            },
          ),
        ),
        ListTile(
          title: const Text('Localization'),
          trailing: CustomDropdown(
            value: 'English',
            items: const ['English', 'French'],
            onChanged: (newValue) {},
          ),
        ),
      ],
    );
  }
}

import 'package:daily_hogwarts/core/model/theme_inherited_widget.dart';
import 'package:daily_hogwarts/core/ui/custom_card.dart';
import 'package:daily_hogwarts/core/ui/custom_dropdown.dart';
import 'package:flutter/material.dart';

class Customization extends StatelessWidget {
  const Customization({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier =
        ThemeInheritedWidget.of(context).themeNotifier;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return CustomCard(
          title: 'Customization',
          children: [
            ListTile(
              title: const Text('Theme'),
              trailing: CustomDropdown(
                value: themeMode == ThemeMode.light ? "Light" : "Dark",
                items: const ['Light', 'Dark'],
                onChanged: (newValue) {
                  final newTheme =
                      newValue == "Light" ? ThemeMode.light : ThemeMode.dark;
                  themeNotifier.switchTheme(newTheme);
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
      },
    );
  }
}

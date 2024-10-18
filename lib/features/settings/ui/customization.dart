import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/settings_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_card.dart';
import 'package:daily_hogwarts/core/ui/custom_dropdown.dart';
import 'package:daily_hogwarts/core/utils/enums/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Customization extends StatelessWidget {
  const Customization({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsViewModel settingsViewMode =
        context.watch<SettingsViewModel>();
    final t = context.t;

    Map<String, String> languages = {
      Language.english.name: t.english,
      Language.french.name: t.french,
    };

    return CustomCard(
      title: t.customization,
      children: [
        ListTile(
          title: Text(t.theme),
          trailing: CustomDropdown(
            value: settingsViewMode.themeMode == ThemeMode.light
                ? t.lightTheme
                : t.darkTheme,
            items: [
              t.lightTheme,
              t.darkTheme,
            ],
            onChanged: (newValue) {
              final newTheme =
                  newValue == t.lightTheme ? ThemeMode.light : ThemeMode.dark;
              settingsViewMode.setThemeMode(newTheme);
            },
          ),
        ),
        ListTile(
          title: Text(t.localization),
          trailing: CustomDropdown(
            value: settingsViewMode.locale,
            items: languages.keys.toList(),
            itemsMap: languages,
            onChanged: (newValue) {
              settingsViewMode.setLocale(newValue);
            },
          ),
        ),
      ],
    );
  }
}

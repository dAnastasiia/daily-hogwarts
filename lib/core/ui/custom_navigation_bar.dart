import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Theme.of(context).colorScheme.primaryContainer,
      selectedIndex: selectedIndex,
      destinations: <Widget>[
        NavigationDestination(
          icon: const Icon(CustomIcons.blazon),
          label: t.navigation_house,
        ),
        NavigationDestination(
          icon: const Icon(FontAwesomeIcons.hatWizard),
          label: t.navigation_spells,
        ),
        NavigationDestination(
          icon: const Icon(CustomIcons.castle),
          label: t.navigation_characters,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings),
          label: t.navigation_settings,
        ),
      ],
    );
  }
}

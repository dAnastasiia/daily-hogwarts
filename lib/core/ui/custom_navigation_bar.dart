import 'package:daily_hogwarts/core/utils/custom_icons.dart';
import 'package:flutter/material.dart';

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
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Theme.of(context).colorScheme.primaryContainer,
      selectedIndex: selectedIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(CustomIcons.blazon),
          label: 'House',
        ),
        NavigationDestination(
          icon: Icon(CustomIcons.wand),
          label: 'Spells',
        ),
        NavigationDestination(
          icon: Icon(CustomIcons.castle),
          label: 'Characters',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}

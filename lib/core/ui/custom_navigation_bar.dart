import 'package:daily_hogwarts/core/utils/navigation_items.dart';
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
      destinations: navigationItems.map((item) {
        return NavigationDestination(
          icon: item.icon,
          label: item.label(context),
        );
      }).toList(),
    );
  }
}

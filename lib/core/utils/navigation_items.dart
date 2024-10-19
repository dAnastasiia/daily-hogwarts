import 'package:daily_hogwarts/core/data/navigation_item.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/utils/custom_icons.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<NavigationItem> navigationItems = [
  NavigationItem(
    routeName: Routes.home.name,
    icon: const Icon(CustomIcons.blazon),
    label: (context) => context.t.houseTab,
  ),
  NavigationItem(
    routeName: Routes.spells.name,
    icon: const Icon(FontAwesomeIcons.hatWizard),
    label: (context) => context.t.spellsTab,
  ),
  NavigationItem(
    routeName: Routes.characters.name,
    icon: const Icon(CustomIcons.castle),
    label: (context) => context.t.charactersTab,
  ),
  NavigationItem(
    routeName: Routes.settings.name,
    icon: const Icon(Icons.settings),
    label: (context) => context.t.settingsTab,
  ),
];

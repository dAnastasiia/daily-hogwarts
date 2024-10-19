import 'package:flutter/material.dart';

class NavigationItem {
  final String routeName;
  final Icon icon;
  final String Function(BuildContext) label;

  NavigationItem({
    required this.routeName,
    required this.icon,
    required this.label,
  });
}

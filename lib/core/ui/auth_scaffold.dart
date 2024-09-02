import 'package:daily_hogwarts/core/ui/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AuthScaffold(this.navigationShell, {super.key});

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: navigationShell.currentIndex,
      ),
      body: SafeArea(
        child: navigationShell,
      ),
    );
  }
}

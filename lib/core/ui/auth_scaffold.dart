import 'package:daily_hogwarts/core/extensions/screen_size_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_drawer_navigation.dart';
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
    final isWideScreen = context.isWideScreen;
    final isDesktopScreen = context.isDesktopScreen;

    return Scaffold(
      appBar: isWideScreen && !isDesktopScreen ? AppBar() : null,
      drawer: isWideScreen && !isDesktopScreen
          ? const CustomDrawerNavigation()
          : null,
      bottomNavigationBar: !isWideScreen
          ? CustomNavigationBar(
              onDestinationSelected: _onDestinationSelected,
              selectedIndex: navigationShell.currentIndex,
            )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktopScreen)
              const SizedBox(
                width: 280,
                child: CustomDrawerNavigation(),
              ),
            Expanded(
              child: navigationShell,
            ),
          ],
        ),
      ),
    );
  }
}

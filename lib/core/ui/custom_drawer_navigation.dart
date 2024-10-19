import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/extensions/localization_utils_extension.dart';
import 'package:daily_hogwarts/core/extensions/screen_size_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/score.dart';
import 'package:daily_hogwarts/core/utils/enums/house.dart';
import 'package:daily_hogwarts/core/utils/navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomDrawerNavigation extends StatelessWidget {
  const CustomDrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktopScreen = context.isDesktopScreen;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),
          ...navigationItems.map(
            (item) => ListTile(
              leading: item.icon,
              title: Text(
                item.label(context),
              ),
              onTap: () {
                if (!isDesktopScreen) Navigator.pop(context);
                context.goNamed(item.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Selector<AuthViewModel, House>(
      selector: (_, provider) => provider.house,
      builder: (_, house, ___) => DrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/houses/${house.name}.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              t.getDynamicLocalizedString(house.name).toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Score(
              score: 1542,
              color: house.color,
            ),
          ],
        ),
      ),
    );
  }
}

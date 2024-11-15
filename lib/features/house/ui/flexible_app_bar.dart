import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/extensions/localization_utils_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/score.dart';
import 'package:daily_hogwarts/core/utils/enums/house.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlexibleAppBar extends StatelessWidget {
  const FlexibleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);

    return Selector<AuthViewModel, House>(
      selector: (_, provider) => provider.house,
      builder: (_, house, ___) => SliverAppBar(
        pinned: true,
        expandedHeight: orientation == Orientation.portrait ? 400 : 80,
        flexibleSpace: LayoutBuilder(
          builder: (_, constraints) {
            final isCollapsed = constraints.biggest.height == kToolbarHeight;

            return FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: isCollapsed ? _HouseScore() : null,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/houses/${house.name}.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HouseScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Selector<AuthViewModel, House>(
      selector: (_, provider) => provider.house,
      builder: (_, house, ___) => Container(
        width: double.infinity,
        height: double.maxFinite,
        color: house.color.withOpacity(
          0.1,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.getDynamicLocalizedString(house.name).toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
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

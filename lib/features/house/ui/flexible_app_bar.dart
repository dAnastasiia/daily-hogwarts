import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/utils/custom_icons.dart';
import 'package:daily_hogwarts/core/utils/enums/houses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlexibleAppBar extends StatelessWidget {
  const FlexibleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);

    return Selector<AuthViewModel, Houses>(
      selector: (_, provider) => provider.house,
      builder: (_, house, ___) => SliverAppBar(
        pinned: true,
        expandedHeight: orientation == Orientation.portrait ? 400 : 80,
        flexibleSpace: LayoutBuilder(
          builder: (_, constraints) {
            final isCollapsed = constraints.biggest.height == kToolbarHeight;

            return FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: isCollapsed
                  ? Container(
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
                            house.name.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                CustomIcons.diamond,
                                color: house.color,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "1542",
                                style: TextStyle(
                                  color: house.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : null,
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

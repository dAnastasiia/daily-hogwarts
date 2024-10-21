import 'package:daily_hogwarts/core/extensions/screen_size_extension.dart';
import 'package:daily_hogwarts/features/house/ui/classmates.dart';
import 'package:daily_hogwarts/features/house/ui/favourite_spells.dart';
import 'package:daily_hogwarts/features/house/ui/flexible_app_bar.dart';
import 'package:daily_hogwarts/features/house/ui/teachers.dart';
import 'package:flutter/material.dart';

class HousePage extends StatelessWidget {
  const HousePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWideScreen = context.isWideScreen;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          if (!isWideScreen) const FlexibleAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          const Teachers(),
          const Classmates(),
          if (!isWideScreen)
            const SliverToBoxAdapter(
              child: FavouriteSpells(),
            ),
        ],
      ),
    );
  }
}

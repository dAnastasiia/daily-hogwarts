import 'package:daily_hogwarts/features/house/ui/classmates.dart';
import 'package:daily_hogwarts/features/house/ui/favourite_spells.dart';
import 'package:daily_hogwarts/features/house/ui/flexible_app_bar.dart';
import 'package:daily_hogwarts/features/house/ui/teachers.dart';
import 'package:flutter/material.dart';

class HousePage extends StatelessWidget {
  const HousePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          FlexibleAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          Teachers(),
          Classmates(),
          SliverToBoxAdapter(
            child: FavouriteSpells(),
          ),
        ],
      ),
    );
  }
}

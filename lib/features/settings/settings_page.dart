import 'package:daily_hogwarts/features/settings/ui/account.dart';
import 'package:daily_hogwarts/features/settings/ui/customization.dart';
import 'package:daily_hogwarts/features/settings/ui/main_info.dart';
import 'package:flutter/material.dart';

/// TODO:
/// 1. make components for each section
/// 2. method for adding spacing
/// 3. add house to main info ?
/// 4. inherited widget for localization + comment about lib replacement
/// 5. provider for theme (?? riverpod -- more popular)
///

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> entries = [
      MainInfo(),
      Customization(),
      Account(),
    ];

    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainInfo(),
            SizedBox(height: 16),
            Customization(),
            SizedBox(height: 16),
            Account(),
          ],
        ),
      ),
    );
  }
}

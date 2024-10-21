import 'package:daily_hogwarts/core/utils/layout_builder.dart';
import 'package:daily_hogwarts/features/start/layouts/desktop_layout.dart';
import 'package:daily_hogwarts/features/start/layouts/mobile_layout.dart';
import 'package:daily_hogwarts/features/start/layouts/tablet_layout.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ResponsiveLayoutBuilder(
          mobile: MobileLayout(),
          tablet: TabletLayout(),
          desktop: DesktopLayout(),
        ),
      ),
    );
  }
}

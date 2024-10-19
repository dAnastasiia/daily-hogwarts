import 'package:daily_hogwarts/core/utils/enums/layout_breakpoint.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayoutBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth <= LayoutBreakpoint.sm.width) {
          return mobile;
        } else if (constraints.maxWidth < LayoutBreakpoint.l.width) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}

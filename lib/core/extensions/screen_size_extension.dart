import 'package:daily_hogwarts/core/utils/enums/layout_breakpoint.dart';
import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  bool get isWideScreen {
    final width = MediaQuery.sizeOf(this).width;
    return width > LayoutBreakpoint.xs.width;
  }

  bool get isExtraWideScreen {
    final width = MediaQuery.sizeOf(this).width;
    return width > LayoutBreakpoint.l.width;
  }

  int get gridColumns {
    final width = MediaQuery.sizeOf(this).width;
    if (width < LayoutBreakpoint.xs.width) {
      return 1;
    } else if (width < LayoutBreakpoint.md.width) {
      return 2;
    } else if (width < LayoutBreakpoint.xl.width) {
      return 3;
    } else if (width < LayoutBreakpoint.xxl.width) {
      return 4;
    } else {
      return 5;
    }
  }
}

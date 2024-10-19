import 'package:daily_hogwarts/features/start/ui/buttons_block.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: !kIsWeb,
          child: Flexible(
            flex: 2,
            child: Image.asset('assets/images/hogwarts.png'),
          ),
        ),
        const Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 64.0,
              vertical: 64.0,
            ),
            child: ButtonsBlock(),
          ),
        ),
      ],
    );
  }
}

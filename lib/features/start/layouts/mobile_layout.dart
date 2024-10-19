import 'package:daily_hogwarts/features/start/ui/buttons_block.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

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
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: ButtonsBlock(),
          ),
        ),
      ],
    );
  }
}

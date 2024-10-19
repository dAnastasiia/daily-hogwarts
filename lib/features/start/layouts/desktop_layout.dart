import 'package:daily_hogwarts/features/start/ui/buttons_block.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox.expand(
            child: Image.asset(
              'assets/images/hogwarts.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 80.0,
            ),
            child: ButtonsBlock(),
          ),
        ),
      ],
    );
  }
}

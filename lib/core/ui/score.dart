import 'package:daily_hogwarts/core/utils/custom_icons.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  final Color color;

  const Score({
    super.key,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          CustomIcons.diamond,
          color: color,
        ),
        const SizedBox(width: 12),
        Text(
          score.toString(),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

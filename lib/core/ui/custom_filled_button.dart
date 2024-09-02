import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomFilledButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

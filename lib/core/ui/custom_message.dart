import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  final String message;
  final String? buttonText;
  final VoidCallback? onPressed;

  const CustomMessage({
    super.key,
    required this.message,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 18),
          ),
          if (onPressed != null && buttonText != null) ...[
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onPressed,
              child: Text(buttonText!),
            )
          ],
        ],
      ),
    );
  }
}

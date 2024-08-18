import 'package:flutter/material.dart';

class PrettifiedFieldValue extends StatelessWidget {
  const PrettifiedFieldValue({
    super.key,
    required this.title,
    this.value,
  });

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

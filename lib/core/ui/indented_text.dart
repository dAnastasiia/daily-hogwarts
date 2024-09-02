import 'package:flutter/material.dart';

class IndentedText extends StatelessWidget {
  final String value;

  const IndentedText({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}

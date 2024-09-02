import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? helperText;

  const CustomTextField({
    super.key,
    required this.label,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        helperText: helperText,
        // TODO: provide additional styles
      ),
    );
  }
}

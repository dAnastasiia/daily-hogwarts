import 'package:daily_hogwarts/core/utils/forms/validation.dart';
import 'package:daily_hogwarts/core/utils/forms/validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isRequired;
  final List<Validation<String>>? validators;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.isRequired = false,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: Validator.apply(context, [
        if (isRequired) const RequiredValidation(),
        if (validators != null) ...validators!,
      ]),
    );
  }
}

import 'package:daily_hogwarts/core/utils/forms/validation.dart';
import 'package:daily_hogwarts/core/utils/forms/validator.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool isRequired;
  final List<Validation<String>>? validators;
  final void Function(String?)? onSaved;
  final bool isObscured;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.isRequired = false,
    this.validators,
    this.onSaved,
    this.isObscured = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isObscured ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.isObscured
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => setState(() {
                  _obscureText = !_obscureText;
                }),
              )
            : null,
      ),
      validator: Validator.apply(context, [
        if (widget.isRequired) const RequiredValidation(),
        if (widget.validators != null) ...widget.validators!,
      ]),
      onSaved: widget.onSaved,
    );
  }
}

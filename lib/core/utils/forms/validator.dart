import 'package:daily_hogwarts/core/utils/forms/validation.dart';
import 'package:flutter/widgets.dart';

class Validator {
  Validator();

  static FormFieldValidator<T> apply<T>(
    BuildContext context,
    List<Validation<T>> validations,
  ) {
    return (T? value) {
      for (final validation in validations) {
        final error = validation.validate(context, value);
        if (error != null) return error;
      }

      return null;
    };
  }
}

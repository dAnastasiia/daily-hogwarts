import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:flutter/widgets.dart';

abstract class Validation<T> {
  const Validation();

  String? validate(BuildContext context, T? value);
}

class RequiredValidation<T> extends Validation<T> {
  const RequiredValidation();

  @override
  String? validate(BuildContext context, T? value) {
    final t = context.t;

    if (value == null || (value is String && (value as String).isEmpty)) {
      return t.required;
    }
    return null;
  }
}

class EmailValidation extends Validation<String> {
  const EmailValidation();

  static final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  String? validate(BuildContext context, String? value) {
    final t = context.t;

    if (!_emailRegex.hasMatch(value!)) return t.invalidEmail;
    return null;
  }
}

class PasswordValidation extends Validation<String> {
  const PasswordValidation();

  static final _passwordRegex = RegExp(
    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
  );

  @override
  String? validate(BuildContext context, String? value) {
    final t = context.t;

    if (!_passwordRegex.hasMatch(value!)) return t.invalidPassword;
    return null;
  }
}

class NameValidation extends Validation<String> {
  const NameValidation();

  static final _nameRegex = RegExp(
    r"^[a-zA-ZÀ-ÿ\s'-.]+(?:\s[a-zA-ZÀ-ÿ\s'-.]+)+$",
  );

  @override
  String? validate(BuildContext context, String? value) {
    final t = context.t;

    if (!_nameRegex.hasMatch(value!)) return t.invalidName;
    return null;
  }
}

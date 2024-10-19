import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsBlock extends StatelessWidget {
  const ButtonsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          t.welcome,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        CustomFilledButton(
          title: t.login,
          onPressed: () => context.goNamed(Routes.login.name),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        const SizedBox(height: 12),
        CustomFilledButton(
          title: t.signup,
          onPressed: () => context.pushNamed(Routes.signup.name),
          backgroundColor: Colors.deepPurple.shade100,
          foregroundColor: Colors.black,
        ),
      ],
    );
  }
}

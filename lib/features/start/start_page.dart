import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/utils/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Image.asset('assets/images/hogwarts.png'),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

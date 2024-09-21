import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/ui/custom_text_field.dart';
import 'package:daily_hogwarts/core/utils/methods/get_prettified_widgets_list.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: Consumer<AuthViewModel>(
        builder: (_, authProvider, __) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                t.loginPageTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 54),
              ...getPrettifiedWidgetsList(
                entries: [
                  CustomTextField(label: t.username),
                  CustomTextField(label: t.password),
                ],
                spacing: 20,
              ),
              const SizedBox(height: 48),
              CustomFilledButton(
                title: t.login,
                onPressed: () {
                  // * Success login imitation
                  authProvider.login();
                  context.goNamed(Routes.home.name);
                },
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.pushNamed(Routes.signup.name),
                child: Text(t.signup),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/ui/custom_text_field.dart';
import 'package:daily_hogwarts/core/utils/methods/get_prettified_widgets_list.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Consumer<AuthViewModel>(
        builder: (_, authProvider, __) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Main information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...getPrettifiedWidgetsList(
                entries: [
                  const CustomTextField(
                    label: 'Username',
                  ),
                  const CustomTextField(
                    label: 'Email',
                  ),
                  const CustomTextField(
                    label: 'Password',
                  ),
                ],
                spacing: 20,
              ),
              const SizedBox(height: 60),
              const Text(
                'Sorting Hat Questions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...getPrettifiedWidgetsList(
                entries: [
                  const CustomTextField(
                    label: 'What is your creature?',
                  ),
                  const CustomTextField(
                    label: 'What is your best quality?',
                  ),
                  const CustomTextField(
                    label: 'What is your dream?',
                  ),
                ],
                spacing: 20,
              ),
              const SizedBox(height: 60),
              CustomFilledButton(
                title: 'Let\'s go',
                onPressed: () {
                  // * Success signup imitation
                  authProvider.signup();
                  context.goNamed(Routes.home.name);
                },
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

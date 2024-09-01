import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/ui/custom_text_field.dart';
import 'package:daily_hogwarts/core/utils/methods/get_prettified_widgets_list.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              onPressed: () {},
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
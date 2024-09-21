import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
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
    final t = context.t;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: context.pop,
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
              Text(
                t.mainInfo,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...getPrettifiedWidgetsList(
                entries: [
                  CustomTextField(
                    label: t.username,
                  ),
                  CustomTextField(
                    label: t.email,
                  ),
                  CustomTextField(
                    label: t.password,
                  ),
                ],
                spacing: 20,
              ),
              const SizedBox(height: 60),
              Text(
                t.sortingHatQuestions,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...getPrettifiedWidgetsList(
                entries: [
                  CustomTextField(
                    label: t.creatureQuestion,
                  ),
                  CustomTextField(
                    label: t.bestQualityQuestion,
                  ),
                  CustomTextField(
                    label: t.dreamQuestion,
                  ),
                ],
                spacing: 20,
              ),
              const SizedBox(height: 60),
              CustomFilledButton(
                title: t.letsGo,
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

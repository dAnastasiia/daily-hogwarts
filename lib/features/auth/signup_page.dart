import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/ui/custom_text_field.dart';
import 'package:daily_hogwarts/core/utils/forms/validation.dart';
import 'package:daily_hogwarts/core/utils/methods/get_prettified_widgets_list.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

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
          child: SingleChildScrollView(
            // Add SingleChildScrollView
            child: Form(
              key: formKey,
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
                        labelText: t.username,
                        isRequired: true,
                        validators: const [
                          RequiredValidation(),
                          NameValidation(),
                        ],
                      ),
                      CustomTextField(
                        labelText: t.email,
                        isRequired: true,
                        validators: const [
                          RequiredValidation(),
                          EmailValidation(),
                        ],
                      ),
                      CustomTextField(
                        labelText: t.password,
                        isRequired: true,
                        validators: const [
                          RequiredValidation(),
                          PasswordValidation(),
                        ],
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
                        labelText: t.creatureQuestion,
                        isRequired: true,
                        validators: const [
                          RequiredValidation(),
                        ],
                      ),
                      CustomTextField(
                        labelText: t.bestQualityQuestion,
                        isRequired: true,
                        validators: const [
                          RequiredValidation(),
                        ],
                      ),
                      CustomTextField(
                        labelText: t.dreamQuestion,
                        isRequired: true,
                        validators: const [
                          RequiredValidation(),
                        ],
                      ),
                    ],
                    spacing: 20,
                  ),
                  const SizedBox(height: 60),
                  CustomFilledButton(
                    title: t.letsGo,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // // * Success signup imitation
                        // authProvider.signup();
                        // context.goNamed(Routes.home.name);
                      }
                    },
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

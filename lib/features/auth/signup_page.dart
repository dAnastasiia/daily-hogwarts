import 'package:daily_hogwarts/core/data/auth_payload.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/ui/custom_text_field.dart';
import 'package:daily_hogwarts/core/ui/notifications_handler.dart';
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

  String? _username;
  String? _email;
  String? _password;

  void _saveForm(
    AuthViewModel authProvider,
    VoidCallback onSuccess,
    Function(String) onError,
  ) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await authProvider.signup(
        AuthPayload(
          email: _email!,
          password: _password!,
          username: _username!,
        ),
        onSuccess,
        onError,
      );
    }
  }

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
                        onSaved: (value) => _username = value,
                      ),
                      CustomTextField(
                        labelText: t.email,
                        isRequired: true,
                        validators: const [
                          RequiredValidation(),
                          EmailValidation(),
                        ],
                        onSaved: (value) => _email = value,
                      ),
                      CustomTextField(
                        labelText: t.password,
                        isRequired: true,
                        isObscured: true,
                        validators: const [
                          RequiredValidation(),
                          PasswordValidation(),
                        ],
                        onSaved: (value) => _password = value,
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
                        onSaved: (value) {},
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
                    isLoading: authProvider.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _saveForm(
                          authProvider,
                          () => context.goNamed(Routes.home.name),
                          (error) => NotificationHandler.showError(
                            context,
                            error,
                          ),
                        );
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

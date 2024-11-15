import 'package:daily_hogwarts/core/data/auth_payload.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_filled_button.dart';
import 'package:daily_hogwarts/core/ui/custom_text_field.dart';
import 'package:daily_hogwarts/core/ui/form_wrapper.dart';
import 'package:daily_hogwarts/core/ui/notifications_handler.dart';
import 'package:daily_hogwarts/core/utils/enums/auth_status.dart';
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

  void _submitForm(AuthViewModel authProvider) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      authProvider.signup(
        AuthPayload(
          email: _email!,
          password: _password!,
          username: _username!,
        ),
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
        builder: (_, authProvider, __) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (authProvider.status == AuthStatus.loggedIn) {
              context.goNamed(Routes.home.name);
            }

            if (authProvider.status == AuthStatus.error &&
                authProvider.errorMessage.isNotEmpty) {
              NotificationHandler.showError(
                context,
                authProvider.errorMessage,
              );

              authProvider.resetError();
            }
          });

          return FormWrapper(
            formKey: formKey,
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
                      NameValidation(),
                    ],
                    onSaved: (value) => _username = value,
                  ),
                  CustomTextField(
                    labelText: t.email,
                    isRequired: true,
                    validators: const [
                      EmailValidation(),
                    ],
                    onSaved: (value) => _email = value,
                  ),
                  CustomTextField(
                    labelText: t.password,
                    isRequired: true,
                    isObscured: true,
                    validators: const [
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
                  ),
                  CustomTextField(
                    labelText: t.bestQualityQuestion,
                    isRequired: true,
                  ),
                  CustomTextField(
                    labelText: t.dreamQuestion,
                    isRequired: true,
                  ),
                ],
                spacing: 20,
              ),
              const SizedBox(height: 60),
              CustomFilledButton(
                title: t.letsGo,
                isLoading: authProvider.isLoading,
                onPressed: () => _submitForm(authProvider),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ],
          );
        },
      ),
    );
  }
}

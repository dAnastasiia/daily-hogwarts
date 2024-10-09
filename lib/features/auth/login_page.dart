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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  void _submitForm(
    AuthViewModel authProvider,
    VoidCallback onSuccess,
    Function(String) onError,
  ) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await authProvider.login(
        AuthPayload(
          email: _email!,
          password: _password!,
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
      body: Consumer<AuthViewModel>(
        builder: (_, authProvider, __) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
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
                const SizedBox(height: 48),
                CustomFilledButton(
                  title: t.login,
                  isLoading: authProvider.isLoading,
                  onPressed: () => _submitForm(
                    authProvider,
                    () => context.goNamed(Routes.home.name),
                    (error) => NotificationHandler.showError(
                      context,
                      error,
                    ),
                  ),
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
      ),
    );
  }
}

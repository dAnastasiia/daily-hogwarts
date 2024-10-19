import 'package:daily_hogwarts/core/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class FormWrapper extends StatelessWidget {
  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  const FormWrapper({
    super.key,
    required this.formKey,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final isWideScreen = context.isWideScreen;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isWideScreen ? 480.0 : double.infinity,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

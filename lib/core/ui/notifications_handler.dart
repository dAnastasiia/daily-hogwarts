import 'package:flutter/material.dart';

class NotificationHandler {
  static void showError(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showWarning(BuildContext context, String warningMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(warningMessage),
        backgroundColor: Colors.orange,
      ),
    );
  }

  static void showSuccess(BuildContext context, String successMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(successMessage),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void showInfo(BuildContext context, String infoMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(infoMessage),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

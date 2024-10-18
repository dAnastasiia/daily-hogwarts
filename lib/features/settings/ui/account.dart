import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_card.dart';
import 'package:daily_hogwarts/core/ui/loading_indicator.dart';
import 'package:daily_hogwarts/core/ui/notifications_handler.dart';
import 'package:daily_hogwarts/core/utils/enums/auth_status.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Consumer<AuthViewModel>(
      builder: (_, authProvider, __) {
        if (authProvider.isLoading) {
          return const LoadingIndicator();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (authProvider.status == AuthStatus.notLoggedIn) {
            context.goNamed(Routes.start.name);
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

        return CustomCard(
          title: t.account,
          children: [
            _MenuItem(
              itemTitle: t.privacyPolicy,
              onTap: () {},
            ),
            _MenuItem(
              itemTitle: t.termsAndConditions,
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: Text(
                t.logout,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              leading: const Icon(Icons.logout, color: Colors.red),
              onTap: authProvider.logout,
            ),
          ],
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String itemTitle;
  final VoidCallback onTap;

  const _MenuItem({
    required this.itemTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
      onTap: onTap,
    );
  }
}

import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_card.dart';
import 'package:daily_hogwarts/core/utils/extensions/localization_extension.dart';
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
      builder: (_, authProvider, __) => CustomCard(
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
            onTap: () {
              // * Success logout imitation
              authProvider.logout();
              context.goNamed(Routes.start.name);
            },
          ),
        ],
      ),
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

import 'package:daily_hogwarts/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Account',
      children: [
        _MenuItem(
          itemTitle: 'Privacy Policy',
          onTap: () {},
        ),
        _MenuItem(
          itemTitle: 'Terms and Conditions',
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          leading: const Icon(Icons.logout, color: Colors.red),
          onTap: () {},
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.itemTitle,
    required this.onTap,
  });

  final String itemTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
      onTap: onTap,
    );
  }
}

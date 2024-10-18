import 'package:daily_hogwarts/core/data/user_model.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Selector<AuthViewModel, UserModel?>(
      selector: (_, provider) => provider.user,
      builder: (_, user, ___) => CustomCard(
        title: t.mainInfo,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            title: Text(user?.username ?? "John Doe"),
            subtitle: Text(user?.email ?? "test@example.com"),
          ),
        ],
      ),
    );
  }
}

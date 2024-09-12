import 'package:daily_hogwarts/core/ui/custom_card.dart';
import 'package:daily_hogwarts/core/utils/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return CustomCard(
      title: t.mainInfo,
      children: const [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          title: Text('Jane Doe'),
          subtitle: Text('jane.doe@example.com'),
        ),
      ],
    );
  }
}

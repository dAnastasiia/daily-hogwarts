import 'package:daily_hogwarts/core/widgets/custom_card.dart';
import 'package:daily_hogwarts/core/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class Customization extends StatelessWidget {
  const Customization({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Customization',
      children: [
        ListTile(
          title: const Text('Theme'),
          trailing: CustomDropdown(
            value: 'Dark',
            items: const ['Light', 'Dark'],
            onChanged: (newValue) {},
          ),
        ),
        ListTile(
          title: const Text('Localization'),
          trailing: CustomDropdown(
            value: 'English',
            items: const ['English', 'French'],
            onChanged: (newValue) {},
          ),
        ),
      ],
    );
  }
}

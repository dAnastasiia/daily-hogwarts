import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/core/utils/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/utils/extensions/localization_utils_extension.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  const CharacterItem({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              character.image,
            ),
          ),
          title: Text(
            character.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            t.getDynamicLocalizedString(character.house.toLowerCase()),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

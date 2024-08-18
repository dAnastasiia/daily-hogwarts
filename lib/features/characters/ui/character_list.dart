import 'package:daily_hogwarts/core/models/character_model.dart';
import 'package:daily_hogwarts/features/characters/ui/character_item.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({
    super.key,
    required this.characters,
    required this.onClick,
  });

  final List<Character> characters;
  final Function(Character) onClick;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: characters[index],
          onTap: () => onClick(characters[index]),
        );
      },
    );
  }
}

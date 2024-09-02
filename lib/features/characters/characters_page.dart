import 'package:daily_hogwarts/core/utils/mock_characters.dart';
import 'package:daily_hogwarts/features/characters/character_details_page.dart';
import 'package:daily_hogwarts/features/characters/ui/character_item.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (_, index) {
        final character = characters[index];

        return CharacterItem(
          character: character,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CharacterDetailsPage(character: character),
              )),
        );
      },
    );
  }
}

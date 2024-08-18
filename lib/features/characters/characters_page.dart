import 'package:daily_hogwarts/core/utils/mock_characters.dart';
import 'package:daily_hogwarts/features/characters/character_details_page.dart';
import 'package:daily_hogwarts/features/characters/ui/character_list.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CharacterList(
      characters: characters,
      onClick: (character) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailsPage(
              character: character,
            ),
          ),
        );
      },
    );
  }
}

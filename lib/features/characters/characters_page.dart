import 'package:daily_hogwarts/core/utils/mock_characters.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:daily_hogwarts/features/characters/ui/character_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          onTap: () => context.pushNamed(
            Routes.characterDetails.name,
            pathParameters: {'id': character.id},
          ),
        );
      },
    );
  }
}

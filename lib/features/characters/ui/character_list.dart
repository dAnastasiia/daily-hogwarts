import 'package:daily_hogwarts/features/characters/character_details_page.dart';
import 'package:flutter/material.dart';

import 'character_item.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({
    super.key,
    required this.characters,
  });

  final List<Map<String, dynamic>> characters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: characters[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterDetailsPage(
                  character: characters[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

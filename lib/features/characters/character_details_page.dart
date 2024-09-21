import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/extensions/localization_utils_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_text_list.dart';
import 'package:daily_hogwarts/core/ui/indented_text.dart';
import 'package:daily_hogwarts/core/ui/prettified_field_value.dart';
import 'package:daily_hogwarts/core/utils/mock_characters.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharacterDetailsPage extends StatelessWidget {
  final String id;

  const CharacterDetailsPage({
    super.key,
    required this.id,
  });

  String _getValue(dynamic value) {
    if (value is int || value is double) {
      return value.toString();
    }

    return (value == null || value.isEmpty) ? '-' : value.toString();
  }

  String _getWandDetail(String label, String value) {
    return '$label: ${_getValue(value)}';
  }

  // * Temporary solution before implementing API calls
  Character? _getCharacterById(String id) {
    return characters.firstWhere(
      (character) => character.id == id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final character = _getCharacterById(id);

    if (character == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: context.pop,
          ),
        ),
        body: Center(
          child: Text(t.notFoundCharacter),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: context.pop,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  character.image,
                ),
                radius: 75,
              ),
            ),
            const SizedBox(height: 32),
            PrettifiedFieldValue(
              title: t.house,
              value: t.getDynamicLocalizedString(character.house.toLowerCase()),
            ),
            const SizedBox(height: 8),
            PrettifiedFieldValue(
              title: t.patronus,
              value: _getValue(character.patronus),
            ),
            const SizedBox(height: 24),
            CustomTextList(
              title: t.wand,
              entries: [
                IndentedText(
                  value: _getWandDetail(
                    t.wood,
                    _getValue(character.wand.wood),
                  ),
                ),
                IndentedText(
                  value: _getWandDetail(
                    t.core,
                    _getValue(character.wand.core),
                  ),
                ),
                IndentedText(
                  value: _getWandDetail(
                    t.length,
                    _getValue(character.wand.length),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            PrettifiedFieldValue(
              title: t.ancestry,
              value: _getValue(character.ancestry),
            ),
          ],
        ),
      ),
    );
  }
}

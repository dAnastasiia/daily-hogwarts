import 'package:daily_hogwarts/core/widgets/custom_text_list.dart';
import 'package:daily_hogwarts/core/widgets/indented_text.dart';
import 'package:daily_hogwarts/core/widgets/prettified_field_value.dart';
import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    super.key,
    required this.character,
  });

  final Map<String, dynamic> character;

  String _getValue(dynamic value) {
    if (value is int || value is double) {
      return value.toString();
    }

    return (value == null || value.isEmpty) ? 'unknown' : value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  character['image'],
                ),
                radius: 75,
              ),
            ),
            const SizedBox(height: 32),
            PrettifiedFieldValue(
              title: "House: ",
              value: character["house"],
            ),
            const SizedBox(height: 8),
            PrettifiedFieldValue(
              title: "Patronus: ",
              value: _getValue(character['patronus']),
            ),
            const SizedBox(height: 24),
            CustomTextList(
              title: "Wand",
              entries: [
                IndentedText(
                  value: 'Wood: ${_getValue(character['wand']['wood'])}',
                ),
                IndentedText(
                  value: 'Core: ${_getValue(character['wand']['core'])}',
                ),
                IndentedText(
                  value: 'Length: ${_getValue(character['wand']['length'])}',
                ),
              ],
            ),
            const SizedBox(height: 24),
            PrettifiedFieldValue(
              title: "Ancestry: ",
              value: _getValue(character['ancestry']),
            ),
          ],
        ),
      ),
    );
  }
}

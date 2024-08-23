import 'package:daily_hogwarts/features/spells/ui/spell_card.dart';
import 'package:flutter/material.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpellCard(name: "Accio", description: "Summons objects"),
    );
  }
}

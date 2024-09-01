import 'package:daily_hogwarts/features/spells/data/spells_view_model.dart';
import 'package:daily_hogwarts/features/spells/ui/spells_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SpellsViewModel(),
      builder: (notifierContext, __) {
        final spellsProvider = notifierContext.watch<SpellsViewModel>();
        final spells = spellsProvider.spells;

        if (spells.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Charms class is over 🎃',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: spellsProvider.fetchSpells,
                  child: const Text('Repeat'),
                ),
              ],
            ),
          );
        }

        return SpellsSwiper(
          cardsTotal: spells.length,
          isLastSpell: spells.length == 1,
        );
      },
    );
  }
}

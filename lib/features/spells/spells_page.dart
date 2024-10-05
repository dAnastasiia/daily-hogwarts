import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_message.dart';
import 'package:daily_hogwarts/features/spells/data/spells_view_model.dart';
import 'package:daily_hogwarts/features/spells/ui/spells_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return ChangeNotifierProvider(
      create: (_) => SpellsViewModel(),
      builder: (notifierContext, __) {
        final spellsProvider = notifierContext.watch<SpellsViewModel>();
        final spells = spellsProvider.spells;

        if (spells.isEmpty) {
          return CustomMessage(
            message: t.charmClassOver,
            buttonText: t.repeat,
            onPressed: spellsProvider.fetchSpells,
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

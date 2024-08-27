import 'package:daily_hogwarts/features/spells/data/spells_provider.dart';
import 'package:daily_hogwarts/features/spells/ui/spell_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CardSwiperController cardSwiperController = CardSwiperController();

    return ChangeNotifierProvider(
      create: (_) {
        final provider = SpellsProvider();
        provider.fetchSpells();
        return provider;
      },
      builder: (context, __) {
        final spellsProvider = context.watch<SpellsProvider>();
        final spells = spellsProvider.spells;
        final isLastSpell = spells.length == 1;

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

        return Flexible(
          child: CardSwiper(
            controller: cardSwiperController,
            cardsCount: spells.length,
            allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
              horizontal: true,
              vertical: false,
            ),
            numberOfCardsDisplayed: isLastSpell ? 1 : 2,
            backCardOffset: const Offset(0, 48),
            onSwipe: (_, __, direction) {
              if (direction == CardSwiperDirection.right) {
                spellsProvider.castSpell();
              } else {
                spellsProvider.removeSpell();
              }

              return true;
            },
            cardBuilder: (_, __, ___, ____) => Center(
              child: SpellCard(cardSwiperController: cardSwiperController),
            ),
          ),
        );
      },
    );
  }
}

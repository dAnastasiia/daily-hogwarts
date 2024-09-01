import 'package:daily_hogwarts/features/spells/ui/spell_card.dart';
import 'package:daily_hogwarts/features/spells/utils/mock_spells.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CardSwiper(
        cardsCount: spells.length,
        allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
          horizontal: true,
          vertical: false,
        ),
        backCardOffset: const Offset(0, 48),
        cardBuilder: (_, __, ___, ____) => const Center(
          child: SpellCard(
            name: "Accio",
            description: "Summons objects",
          ),
        ),
      ),
    );
  }
}

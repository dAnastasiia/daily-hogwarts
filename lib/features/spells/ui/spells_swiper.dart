import 'package:daily_hogwarts/features/spells/data/spells_view_model.dart';
import 'package:daily_hogwarts/features/spells/ui/spell_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class SpellsSwiper extends StatefulWidget {
  final int cardsTotal;
  final bool isLastSpell;

  const SpellsSwiper({
    super.key,
    required this.cardsTotal,
    required this.isLastSpell,
  });

  @override
  State<SpellsSwiper> createState() => _SpellsSwiperState();
}

class _SpellsSwiperState extends State<SpellsSwiper> {
  final CardSwiperController _cardSwiperController = CardSwiperController();

  @override
  void dispose() {
    _cardSwiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SpellsViewModel>(
      builder: (_, spellsProvider, __) => CardSwiper(
        controller: _cardSwiperController,
        cardsCount: widget.cardsTotal,
        allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
          horizontal: true,
          vertical: false,
        ),
        numberOfCardsDisplayed: widget.isLastSpell ? 1 : 2,
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
          child: SpellCard(
            onRemove: () =>
                _cardSwiperController.swipe(CardSwiperDirection.left),
            onCast: () =>
                _cardSwiperController.swipe(CardSwiperDirection.right),
          ),
        ),
      ),
    );
  }
}

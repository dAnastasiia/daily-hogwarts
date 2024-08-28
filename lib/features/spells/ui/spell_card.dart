import 'package:daily_hogwarts/core/models/spell_model.dart';
import 'package:daily_hogwarts/features/spells/data/spells_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class SpellCard extends StatelessWidget {
  const SpellCard({
    super.key,
    required this.cardSwiperController,
  });

  final CardSwiperController cardSwiperController;

  @override
  Widget build(BuildContext context) {
    return Selector<SpellsViewModel, Spell>(
      selector: (_, provider) => provider.spell,
      builder: (_, spell, ___) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spell.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                spell.description,
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.clear),
                    color: Colors.red,
                    iconSize: 48,
                    onPressed: () =>
                        cardSwiperController.swipe(CardSwiperDirection.left),
                  ),
                  IconButton(
                    icon: const Icon(Icons.local_fire_department_rounded),
                    color: Colors.yellow.shade700,
                    iconSize: 48,
                    onPressed: () =>
                        cardSwiperController.swipe(CardSwiperDirection.right),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

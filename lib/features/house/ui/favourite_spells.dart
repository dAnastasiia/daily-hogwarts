import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/prettified_field_value.dart';
import 'package:daily_hogwarts/core/utils/mock_spells.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteSpells extends StatelessWidget {
  const FavouriteSpells({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final t = context.t;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: PrettifiedFieldValue(
              title: t.favouriteSpells,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: spells.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 16,
              childAspectRatio: 4,
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (_, index) {
              return _SpellsGridItem(
                text: spells[index].name,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SpellsGridItem extends StatelessWidget {
  final String text;

  const _SpellsGridItem({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel, Color>(
      selector: (_, provider) => provider.house.color,
      builder: (_, color, ___) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(color: color),
          ),
        ),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/extensions/localization_utils_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_message.dart';
import 'package:daily_hogwarts/core/ui/loading_indicator.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:daily_hogwarts/features/characters/bloc/characters/characters_bloc.dart';
import 'package:daily_hogwarts/features/characters/ui/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider(
      create: (_) => CharactersBloc()..add(FetchCharacters()),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (_, state) {
          switch (state) {
            case CharactersLoading _:
              return const LoadingIndicator();
            case CharactersSuccess _:
              final characters = state.characters;

              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (state, index) {
                  final character = characters[index];

                  return CharacterItem(
                    character: character,
                    onTap: () => context.pushNamed(
                      Routes.characterDetails.name,
                      pathParameters: {'id': character.id},
                    ),
                  );
                },
              );
            case CharactersError _:
              return CustomMessage(
                message: t.getDynamicLocalizedString(state.error),
                buttonText: t.repeat,
                onPressed: () =>
                    context.read<CharactersBloc>().add(FetchCharacters()),
              );
            default:
              return CustomMessage(
                message: t.noData,
              );
          }
        },
      ),
    );
  }
}

import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/core/extensions/localization_extension.dart';
import 'package:daily_hogwarts/core/extensions/localization_utils_extension.dart';
import 'package:daily_hogwarts/core/ui/custom_avatar.dart';
import 'package:daily_hogwarts/core/ui/custom_message.dart';
import 'package:daily_hogwarts/core/ui/custom_text_list.dart';
import 'package:daily_hogwarts/core/ui/indented_text.dart';
import 'package:daily_hogwarts/core/ui/loading_indicator.dart';
import 'package:daily_hogwarts/core/ui/prettified_field_value.dart';
import 'package:daily_hogwarts/features/characters/bloc/character/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CharacterDetailsPage extends StatelessWidget {
  final String id;

  const CharacterDetailsPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider(
      create: (_) => CharacterBloc()..add(FetchCharacter(id)),
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,
                child: Text(
                  state is CharacterSuccess
                      ? state.character.name
                      : t.characterDetails,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: context.pop,
              ),
            ),
            body: (() {
              return switch (state) {
                CharacterLoading() => const LoadingIndicator(),
                CharacterSuccess() =>
                  _CharacterProfile(character: state.character),
                CharacterError() => CustomMessage(
                    message: t.getDynamicLocalizedString(state.error),
                    buttonText: t.repeat,
                    onPressed: () =>
                        context.read<CharacterBloc>().add(FetchCharacter(id)),
                  ),
              };
            }()),
          );
        },
      ),
    );
  }
}

class _CharacterProfile extends StatelessWidget {
  final Character character;

  const _CharacterProfile({
    required this.character,
  });

  String _getValue(dynamic value) {
    if (value is int || value is double) {
      return value.toString();
    }

    return (value == null || value.isEmpty) ? '-' : value.toString();
  }

  String _getWandDetail(String label, String value) {
    return '$label: ${_getValue(value)}';
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomAvatar(
              src: character.image,
              radius: 75,
            ),
          ),
          const SizedBox(height: 32),
          PrettifiedFieldValue(
            title: t.house,
            value: t.getDynamicLocalizedString(
              character.house.toLowerCase(),
            ),
          ),
          const SizedBox(height: 8),
          PrettifiedFieldValue(
            title: t.patronus,
            value: _getValue(character.patronus),
          ),
          const SizedBox(height: 24),
          CustomTextList(
            title: t.wand,
            entries: [
              IndentedText(
                value: _getWandDetail(
                  t.wood,
                  _getValue(character.wand.wood),
                ),
              ),
              IndentedText(
                value: _getWandDetail(
                  t.core,
                  _getValue(character.wand.core),
                ),
              ),
              IndentedText(
                value: _getWandDetail(
                  t.length,
                  _getValue(character.wand.length),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          PrettifiedFieldValue(
            title: t.ancestry,
            value: _getValue(character.ancestry),
          ),
        ],
      ),
    );
  }
}

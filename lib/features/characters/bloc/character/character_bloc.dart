import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/features/characters/data/characters_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository characterRepository;

  CharacterBloc()
      : characterRepository = CharactersRepository(),
        super(CharacterLoading()) {
    on<FetchCharacter>(_onFetchCharacterById);
  }

  Future<void> _onFetchCharacterById(
    FetchCharacter event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading());
    try {
      final character = await characterRepository.getCharacterById(event.id);

      emit(CharacterSuccess(character));
    } catch (e) {
      emit(CharacterError(error: e.toString()));
    }
  }
}

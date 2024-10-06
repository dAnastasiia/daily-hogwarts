import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/features/characters/data/characters_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepository characterRepository;

  CharactersBloc()
      : characterRepository = CharactersRepository(),
        super(CharactersLoading()) {
    on<FetchCharacters>(_onFetchCharacters);
  }

  Future<void> _onFetchCharacters(
    FetchCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    emit(CharactersLoading());
    try {
      final characters = await characterRepository.fetchCharacters();
      emit(CharactersSuccess(characters));
    } catch (e) {
      emit(CharactersError(error: e.toString()));
    }
  }
}

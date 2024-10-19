import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/features/characters/data/characters_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classmates_event.dart';
part 'classmates_state.dart';

class ClassmatesBloc extends Bloc<ClassmatesEvent, ClassmatesState> {
  final CharactersRepository characterRepository;

  ClassmatesBloc()
      : characterRepository = CharactersRepository(),
        super(ClassmatesLoading()) {
    on<FetchClassmates>(_onFetchClassmates);
  }

  Future<void> _onFetchClassmates(
    FetchClassmates event,
    Emitter<ClassmatesState> emit,
  ) async {
    emit(ClassmatesLoading());
    try {
      final classmates = await characterRepository.fetchClassmates(event.house);
      emit(ClassmatesSuccess(classmates));
    } catch (e) {
      emit(ClassmatesError(error: e.toString()));
    }
  }
}

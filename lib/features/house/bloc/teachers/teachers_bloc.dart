import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:daily_hogwarts/features/characters/data/characters_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  final CharactersRepository characterRepository;

  TeachersBloc()
      : characterRepository = CharactersRepository(),
        super(TeachersLoading()) {
    on<FetchTeachers>(_onFetchTeachers);
  }

  Future<void> _onFetchTeachers(
    FetchTeachers event,
    Emitter<TeachersState> emit,
  ) async {
    emit(TeachersLoading());
    try {
      final teachers = await characterRepository.fetchTeachers();
      emit(TeachersSuccess(teachers));
    } catch (e) {
      emit(TeachersError(error: e.toString()));
    }
  }
}

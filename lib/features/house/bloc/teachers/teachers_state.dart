part of 'teachers_bloc.dart';

@immutable
sealed class TeachersState {}

class TeachersLoading extends TeachersState {}

class TeachersSuccess extends TeachersState {
  final List<Character> teachers;

  TeachersSuccess(this.teachers);
}

class TeachersError extends TeachersState {
  final String error;

  TeachersError({required this.error});
}
